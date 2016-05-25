class CreateAdUsers < ActiveRecord::Migration
  def change
    create_table :ad_users do |t|
      t.references :ad
      t.references :user
      t.references :ad_log_type

      t.timestamps
    end
    add_index :ad_users, :ad_id
    add_index :ad_users, :user_id
  end
end
