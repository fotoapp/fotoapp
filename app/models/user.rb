class User < ActiveRecord::Base

  # https://github.com/EppO/rolify
  rolify

  # Public: Photo stores for user.
  has_many :photo_stores

  # Public: Name of user.
  # column :name
  validates_presence_of :name

  # Public: Email address for user.
  # column :email

  # Public: OAuth provider name.
  # column :provider

  # Public: Id of user on OAuth provider.
  # column :uid

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
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end
end
