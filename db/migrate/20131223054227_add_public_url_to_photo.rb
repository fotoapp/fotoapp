class AddPublicUrlToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :public_url, :string
  end
end
