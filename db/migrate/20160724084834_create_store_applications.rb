# encoding: utf-8

class CreateStoreApplications < ActiveRecord::Migration
  def change
    create_table :store_applications do |t|
      t.references :store_good
      t.references :user
      t.timestamps
    end
    
    add_index :store_applications, :store_good_id
    add_index :store_applications, :user_id
  end
end
