class AddFieldsToUserAddressBooks < ActiveRecord::Migration
  def up
    add_column :user_address_books, :primary_flag, :integer, :null => false, :default => 0
  end

  def down
    remove_column :user_address_books, :primary_flag
  end
end
