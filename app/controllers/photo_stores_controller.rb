class PhotoStoresController < ApplicationController

  before_filter :authenticate_user!

  def create
    PhotoStore.create!(photo_store_params)

    redirect_to :account
  end

  def update
    photo_store = PhotoStore.find(params[:id])
    photo_store.update_attributes!(photo_store_params)

    redirect_to :account
  end

  def destroy
    photo_store = PhotoStore.find(params[:id])
    photo_store.destroy

    redirect_to :account
  end

  private

  def photo_store_params
    params.
      require(:photo_store).
      permit(:provider_key,
             :provider_secret,
             :folder_name).
      merge(:user_id => current_user.id)
  end
end
