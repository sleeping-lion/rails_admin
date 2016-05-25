# encoding: utf-8

class AdState < ActiveRecord::Base
  attr_accessible :view_target, :view_cost, :install_daylimit, :expose_today, :view_today, :extra_budget, :extra_reward, :expose_daylimit, :expose_budget, :extra_daylimit, :expose_total, :view_total, :install_budget, :install_cost, :install_today, :extra_today, :expose_target, :view_budget, :view_reward, :extra_cost, :install_reward, :extra_target, :expose_cost, :expose_reward, :view_daylimit, :install_target, :install_total, :extra_total
  belongs_to :ad, :autosave=>true
  accepts_nested_attributes_for :ad, :allow_destroy => true
end
