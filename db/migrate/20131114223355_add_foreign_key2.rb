# encoding: utf-8

class AddForeignKey2< ActiveRecord::Migration
  def change
      
#    ActiveRecord::Base.connection.execute "ALTER TABLE `addresses` ADD FOREIGN KEY ( `parent_address_id` ) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;"
    
    ActiveRecord::Base.connection.execute "ALTER TABLE `roles_admins` ADD FOREIGN KEY ( `role_id` ) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `roles_admins` ADD FOREIGN KEY ( `admin_id` ) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;"    
    
    
    ActiveRecord::Base.connection.execute "ALTER TABLE `roulette_plays` ADD FOREIGN KEY ( `user_id` ) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `roulette_plays` ADD FOREIGN KEY ( `roulette_setting_id` ) REFERENCES `roulette_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `roulette_plays` ADD FOREIGN KEY ( `point_id` ) REFERENCES `points` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;"    
    
    ActiveRecord::Base.connection.execute "ALTER TABLE `roulette_plays_roulette_presents` ADD FOREIGN KEY ( `roulette_play_id` ) REFERENCES `roulette_plays` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;"    
    ActiveRecord::Base.connection.execute "ALTER TABLE `roulette_plays_roulette_presents` ADD FOREIGN KEY ( `roulette_present_id` ) REFERENCES `roulette_presents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;"                
  end
end 
