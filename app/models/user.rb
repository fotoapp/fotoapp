class User < ActiveRecord::Base

  # Public: Photo stores for user.
  has_many :photo_stores

  # Public: Photos for this user.
  has_many :photos

  # Public: Username for user.
  # column :username
  validates_presence_of :username

  # Public: Name of user.
  # column :name

  # Public: Email address for user.
  # column :email

  # Public: OAuth provider name.
  # column :provider

  # Public: Id of user on OAuth provider.
  # column :uid

  # Public: GitHub OAuth token, handy for making API requests.
  # column :token

  # Public: Created at date and time.
  # column :created_at

  # Public: Updated at date and time.
  # column :updated_at

  # Public: Create user with params from omniauth.
  #
  # auth - Omniauth::Hash
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.username = auth['info']['nickname']
        user.name     = auth['info']['name'] || ""
        user.email    = auth['info']['email'] || ""
        user.token    = auth['credentials']['token']
      end
    end
  end

  # Public: For now we only support one store per User.
  #
  # Returns a PhotoStore.
  def photo_store
    photo_stores.first
  end
end
