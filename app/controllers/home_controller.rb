class HomeController < ApplicationController
  def index
    @photos = if user_signed_in?
      current_user.photos.last(16)
    else
      Photo.last(16)
    end
  end
end
