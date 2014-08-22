class ApplicationController < ActionController::Base

  protect_from_forgery
  helper_method :current_user
  helper_method :user_signed_in?

  private

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue Exception => e
      nil
    end
  end

  def user_signed_in?
    return true if current_user
  end

  def authenticate_user!
    if !current_user
      redirect_to signin_path, :alert => 'Please signin with GitHub to continue using the Foto application.'
    end
  end

  # Internal: PhotoStore required for current user.
  def photo_store_required!
    if !current_photo_store
      redirect_to account_path, :alert => "Please configure your account with your S3 information."
    end
  end

  # Internal: The photo store for the current user if it exists.
  #
  # Returns a PhotoStore or nil.
  def current_photo_store
    current_user.photo_store
  end
end
