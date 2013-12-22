class AccountController < ApplicationController

  before_filter :authenticate_user!

  def show
    @photo_store = PhotoStore.find_or_initialize_by_user_id(current_user.id)
  end
end
