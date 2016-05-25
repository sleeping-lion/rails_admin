# encoding: utf-8

class CreateUserReferrals < ActiveRecord::Migration
  def change
    create_table :user_referrals do |t|
      t.references :user, :unsigned=>true, :null=>false
      t.references :recommend_user, :unsigned=>true, :null=>false
    end

    add_index :user_referrals, :user_id, :unique=>true
    add_index :user_referrals, :recommend_user_id
    add_index :user_referrals, [:user_id, :recommend_user_id], :unique=>true
  end
end
