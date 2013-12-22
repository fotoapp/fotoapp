class User < ActiveRecord::Base
  rolify
  validates_presence_of :name

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
