class CreateQuizAddresses < ActiveRecord::Migration
  def change
    create_table :quiz_addresses do |t|
      t.references :quiz_logs, :null => false
      t.integer :address_id, :null => false
      t.string :name, :limit => 60, :null => false
      t.string :mobilephone, :limit => 60, :null => false
      t.string :address, :null => false
 
      t.timestamps
    end
  end
end
