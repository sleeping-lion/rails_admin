# encoding: utf-8

# In China
class ChangeRequests < ActiveRecord::Migration
  def change
    remove_column :requests, :account_owner
    remove_column :banks, :memo
    remove_column :banks, :bank_code
  end
end
