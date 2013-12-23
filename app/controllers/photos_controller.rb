class PhotosController < ApplicationController
  before_filter :authenticate_user!
  before_filter :photo_store_required!

  def create
    Photo.create! do |photo|
      photo.user          = current_user
      photo.photo_store   = current_photo_store
      photo.title         = params[:photo][:title]
      photo.description   = params[:photo][:description]
      photo.uploaded_file = params[:photo][:file]
    end

    redirect_to root_path
  end
end
