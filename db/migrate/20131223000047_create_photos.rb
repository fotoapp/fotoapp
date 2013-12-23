class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string  :title
      t.text    :description
      t.string  :filename,        :null => false
      t.integer :user_id,         :null => false
      t.string  :checksum,        :null => false
      t.integer :photo_store_id,  :null => false
      t.string  :path,            :null => false

      t.timestamps
    end

    add_index :photos, [:user_id, :checksum], :unique => true
    add_index :photos, [:photo_store_id, :path], :unique => true
  end
end
