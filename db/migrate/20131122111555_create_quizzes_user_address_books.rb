# encoding: utf-8

class CreateQuizzesUserAddressBooks < ActiveRecord::Migration
  def change
    create_table :quizzes_user_address_books do |t|
      t.references :quiz, :null=>false
      t.references :user_address_book, :null=>false
    end
    
    add_index :quizzes_user_address_books, :quiz_id
    add_index :quizzes_user_address_books, :user_address_book_id
  end
end
