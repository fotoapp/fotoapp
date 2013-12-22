class CreatePhotoStores < ActiveRecord::Migration
  def change
    create_table :photo_stores do |t|
      t.integer :user_id,         :null => false
      t.string  :provider_key,    :null => false
      t.string  :provider_secret, :null => false
      t.string  :folder_name

      t.timestamps
    end
  end
end
