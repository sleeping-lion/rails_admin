# encoding: utf-8

class ChangeStoreGoodsAddApplicationCoupon < ActiveRecord::Migration
  def up
    add_column :store_goods, :store_type_id, :integer, :null => false  
    add_column :store_goods, :store_applications_count, :integer, :null => false , :default=>0
  end

  def down
    remove_column :store_goods, :store_type_id
    remove_column :store_goods, :store_applications_count    
  end
end
