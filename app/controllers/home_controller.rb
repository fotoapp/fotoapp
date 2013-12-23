class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @photos = current_user.photos.last(16)
  end
end
