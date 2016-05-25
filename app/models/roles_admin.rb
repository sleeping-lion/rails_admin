# encoding: utf-8

class RolesAdmin < ActiveRecord::Base
  attr_accessible :role_id, :admin_id  
  belongs_to :role, :autosave=>true
  belongs_to :admin, :autosave=>true
  belongs_to :operator, :autosave=>true, :foreign_key=>:admin_id
  accepts_nested_attributes_for :operator, :allow_destroy => true
end
