# encoding: utf-8

class CreateCouponTypes < ActiveRecord::Migration
  def change
    create_table :coupon_types do |t|
      t.string :name
      t.integer :amount
      t.boolean :flag

      t.timestamps
    end
  end
end
