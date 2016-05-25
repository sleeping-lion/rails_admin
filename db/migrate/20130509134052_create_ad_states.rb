# encoding: utf-8

class CreateAdStates < ActiveRecord::Migration
  def change
    create_table :ad_states do |t|
      
      # target : 전체목표수량
      # daylimit : 일간목표수량
      # budget : 예산
      # cost : 단가
      # reward : 사용자 지급 포인트
      
      # total : 전체 집행수량 (0부터 증가)
      # today : 해당일 집행수량 (0부터 증가, 0시 0분 기준, 0으로 업데이트)
      
      t.references :ad, :null => false
      t.integer :expose_target, :null => false, :default => 0
      t.integer :expose_daylimit, :null => false, :default => 0
      t.integer :expose_budget, :null => false, :default => 0
      t.integer :expose_cost, :null => false, :default => 0
      t.integer :expose_reward, :null => false, :default => 0
      t.integer :expose_total, :null => false, :default => 0
      t.integer :expose_today, :null => false, :default => 0
      t.integer :view_target, :null => false, :default => 0
      t.integer :view_daylimit, :null => false, :default => 0
      t.integer :view_budget, :null => false, :default => 0
      t.integer :view_cost, :null => false, :default => 0
      t.integer :view_reward, :null => false, :default => 0
      t.integer :view_total, :null => false, :default => 0
      t.integer :view_today, :null => false, :default => 0
      t.integer :install_target, :null => false, :default => 0
      t.integer :install_daylimit, :null => false, :default => 0
      t.integer :install_budget, :null => false, :default => 0
      t.integer :install_cost, :null => false, :default => 0
      t.integer :install_reward, :null => false, :default => 0
      t.integer :install_total, :null => false, :default => 0
      t.integer :install_today, :null => false, :default => 0
      t.integer :extra_target, :null => false, :default => 0
      t.integer :extra_daylimit, :null => false, :default => 0
      t.integer :extra_budget, :null => false, :default => 0
      t.integer :extra_cost, :null => false, :default => 0
      t.integer :extra_reward, :null => false, :default => 0
      t.integer :extra_total, :null => false, :default => 0
      t.integer :extra_today, :null => false, :default => 0
    end
  end
end
