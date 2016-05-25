# encoding: utf-8

class CreateInternalExchangeRates < ActiveRecord::Migration
  def change
    create_table :internal_exchange_rates do |t|
      t.float :rate, :null => false, :default => 0.0
      t.timestamps
    end
  end
end
