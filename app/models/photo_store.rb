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

  # Public: Folder to use at provider.
  # column :folder_name

  # Public: The directory to store and retrieve files from.
  #
  # Returns a Fog::Storage::AWS::Directory instance.
  def directory
    connection.directories.get(folder_name)
  end

  # Public: The connection needed for storing files and retrieving metadata.
  #
  # Returns a Fog::Storage::AWS instance.
  def connection
    @connection ||= Fog::Storage.new({
                      :provider => "AWS",
                      :aws_access_key_id => provider_key,
                      :aws_secret_access_key => provider_secret
                    })
  end
end
