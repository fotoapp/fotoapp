class User < ActiveRecord::Base

  # https://github.com/EppO/rolify
  rolify

  # Public: Username for user.
  # column :username

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
end
