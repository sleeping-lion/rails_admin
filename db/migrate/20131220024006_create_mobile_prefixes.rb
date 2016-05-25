class CreateMobilePrefixes < ActiveRecord::Migration
  def change
    create_table :mobile_prefixes do |t|
      t.string :locale, :null => false, :max_legnth => 10
      t.string :prefix, :null => false, :max_legnth => 10
      t.integer :prefix_length, :null => false, :default => 3
      t.string :telco, :null => false, :max_legnth => 100

      t.timestamps
    end
  end
end
