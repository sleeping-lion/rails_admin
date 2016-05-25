class AddFieldToQuizAddresses < ActiveRecord::Migration
  def up
    add_column :quiz_addresses, :user_id, :integer, :null => false, :default => 0
  end

  def down
    remove_column :quiz_addresses, :user_id
  end
end
