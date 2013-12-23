require "openssl"
require "digest/sha1"
require "base64"

module AwsSignedUrl
  extend self

  Domain = "s3.amazonaws.com"

  Signs = {"+" => "%2B", "=" => "%3D", "?" => "%3F", "@" => "%40",
           "$" => "%24", "&" => "%26", "," => "%2C", "/" => "%2F",
           ":" => "%3A", ";" => "%3B", "?" => "%3F"}

  Digest = OpenSSL::Digest::Digest.new("sha1")

  def calculate(key, secret, bucket, path, expires_at)
    string_to_sign = "GET\n\n\n#{expires_at.to_i}\n/#{bucket}/#{path}"
    hmac = OpenSSL::HMAC.digest(Digest, secret, string_to_sign)
    signature = encode_signs(URI.escape(Base64.encode64(hmac).strip))
    "https://#{bucket}.#{Domain}/#{path}?AWSAccessKeyId=#{key}&Signature=#{signature}&Expires=#{expires_at.to_i}"
  end

  def encode_signs(string)
    Signs.keys.each do |key|
      string.gsub!(key, Signs[key])
    end

    string
  end
end
