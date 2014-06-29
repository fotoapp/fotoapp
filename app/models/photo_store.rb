# I'm sure storing raw creds in a database unencrypted is a terrible idea but
# I really want this to be a "bring your own storage" multitenant solution
# without having to stand up your own servers so I'm going with this simple
# yet insecure solution for now.

class PhotoStore < ActiveRecord::Base

  # Public: User this PhotoStore belongs to.
  # column :user_id
  belongs_to :user
  validates_presence_of :user_id

  # Public: Storage provider key.
  # column :provider_key
  validates_presence_of :provider_key

  # Public: Storage provider secret.
  # column :provider_secret
  validates_presence_of :provider_secret

  # Public: Root folder name to use at provider.
  # column :folder_name

  # Public: The folder (S3 bucket) to store and retrieve photos from.
  #
  # Returns a Fog::Storage::AWS::Directory instance.
  def folder
    connection.directories.get(folder_name)
  end

  # Public: The connection needed for storing files and retrieving metadata.
  #
  # Returns a Fog::Storage::AWS instance.
  def connection
    @connection ||= begin
      if Rails.env.development?
        Fog::Storage.new({
          :provider   => 'Local',
          :local_root => Rails.root.join("public"),
          :endpoint   => "http://localhost:3000/photos"
        })
      else
        Fog::Storage.new({
          :provider => "AWS",
          :aws_access_key_id => provider_key,
          :aws_secret_access_key => provider_secret
        })
      end
    end
  end

  # Public: Uploads file and returns uploader.
  #
  # Returns a PhotoStore::Upload.
  def upload(path, extension)
    upload = Upload.new(self.folder, path, {:extension => extension})
    upload.save
    upload
  end

  # Public: The secure expiring url for photo by path.
  #
  # path - String path of file in photo store folder.
  # expires_at - Time in the future to expire the url.
  #
  # Returns a String.
  def secure_url(path, expires_at=1.minute.from_now)
    if Rails.env.development?
      "/#{folder_name}/#{path}"
    else
      AwsSignedUrl.calculate \
        provider_key,
        provider_secret,
        folder_name,
        path,
        expires_at
    end
  end
end
