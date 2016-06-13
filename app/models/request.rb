class Request < ActiveRecord::Base
  attr_accessible :user_id, :request_setting_id, :request_type_id, :bank_id, :amount, :account_number # in China , :account_owner
  validates_presence_of  :user_id, :request_type_id, :bank_id, :amount, :account_number # in China, :account_owner
  validates :user_id, :numericality => { :only_integer => true }  
  validates :amount, :numericality => { :only_integer => true }
  belongs_to :user, :autosave=>true
  belongs_to :point, :autosave=>true
  belongs_to :bank, :autosave=>true
  belongs_to :request_type, :autosave=>true
  belongs_to :request_setting, :autosave=>true
end
