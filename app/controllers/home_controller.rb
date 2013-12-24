class HomeController < ApplicationController
  def index
    if user_signed_in?
      @photos = current_user.photos.last(16)
    end
  end
end
