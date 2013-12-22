class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false
      t.string :name
      t.string :email
      t.string :provider
      t.string :uid
      t.string :token

      t.timestamps
    end

    add_index :users, :username, :unique => true
  end
end
