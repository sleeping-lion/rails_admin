class AddFieldsToAds < ActiveRecord::Migration
  def up
    add_column :ads, :display_type, :string, :default => 0, :null => true, :limit => 10
  end

  def down
    remove_column :ads, :display_type
  end
end