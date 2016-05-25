# encoding: utf-8

class CreateRoulettePlaysUserAddressBooks < ActiveRecord::Migration
  def change
    create_table :roulette_plays_user_address_books do |t|
      t.references :roulette_play, :null=>false
      t.references :user_address_book, :null=>false
    end
    
    add_index :roulette_plays_user_address_books, :roulette_play_id
    add_index :roulette_plays_user_address_books, :user_address_book_id
  end
end
