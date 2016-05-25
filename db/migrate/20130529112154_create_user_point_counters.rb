# encoding: utf-8

class CreateUserPointCounters < ActiveRecord::Migration
  def change
    create_table :user_point_counters do |t|
      t.integer :deposit_start, :null=>false, :default=>0
      t.integer :deposit_call, :null=>false, :default=>0
      t.integer :deposit_recommend_user, :null=>false, :default=>0
      t.integer :deposit_recommender, :null=>false, :default=>0
      t.integer :deposit_app_download, :null=>false, :default=>0
      t.integer :deposit_event, :null=>false, :default=>0
      t.integer :deposit_game, :null=>false, :default=>0
      t.integer :deposit_survey, :null=>false, :default=>0
      # t.integer :use_coupon, :null=>false, :default=>0
      t.integer :use_money, :null=>false, :default=>0
      t.integer :use_game, :null=>false, :default=>0    
      t.integer :use_shop, :null=>false, :default=>0
    end
  end
end
