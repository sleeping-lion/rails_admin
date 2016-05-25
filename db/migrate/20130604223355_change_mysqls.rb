# encoding: utf-8

class ChangeMysqls< ActiveRecord::Migration
  def change
          # 광고
    ActiveRecord::Base.connection.execute "ALTER TABLE `ads` ADD FOREIGN KEY ( `ad_type_id` ) REFERENCES `ad_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `ads` ADD FOREIGN KEY ( `admin_id` ) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"                
    ActiveRecord::Base.connection.execute "ALTER TABLE `ads` ADD FOREIGN KEY ( `sponsor_id` ) REFERENCES `sponsors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `ads` ADD FOREIGN KEY ( `agent_id` ) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"     
    ActiveRecord::Base.connection.execute "ALTER TABLE `ad_files` ADD FOREIGN KEY ( `ad_id` ) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `ad_schedules` ADD FOREIGN KEY ( `ad_id` ) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `ad_states` ADD FOREIGN KEY ( `ad_id` ) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `ad_options` ADD FOREIGN KEY ( `ad_id` ) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `ad_memos` ADD FOREIGN KEY ( `id` ) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `ad_targets` ADD FOREIGN KEY ( `ad_schedule_id` ) REFERENCES `ad_schedules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `ad_targets` ADD FOREIGN KEY ( `target_id` ) REFERENCES `targets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `ad_target_addresses` ADD FOREIGN KEY ( `ad_schedule_id` ) REFERENCES `ad_schedules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `ad_target_addresses` ADD FOREIGN KEY ( `address_id` ) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"  
    ActiveRecord::Base.connection.execute "ALTER TABLE `ad_target_cids` ADD FOREIGN KEY ( `ad_schedule_id` ) REFERENCES `ad_schedules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
        

           #  게임 
    ActiveRecord::Base.connection.execute "ALTER TABLE `games` ADD FOREIGN KEY ( `user_id` ) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `games` ADD FOREIGN KEY ( `game_setting_id` ) REFERENCES `game_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `games` ADD FOREIGN KEY ( `point_id` ) REFERENCES `points` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;"

           #  포인트
    ActiveRecord::Base.connection.execute "ALTER TABLE `points` ADD FOREIGN KEY ( `user_id` ) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `points` ADD FOREIGN KEY ( `point_type_id` ) REFERENCES `point_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    
    ActiveRecord::Base.connection.execute "ALTER TABLE `points_ads` ADD FOREIGN KEY ( `point_id` ) REFERENCES `points` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `points_ads` ADD FOREIGN KEY ( `ad_id` ) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"      

           #  현금요청
    ActiveRecord::Base.connection.execute "ALTER TABLE `requests` ADD FOREIGN KEY ( `user_id` ) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `requests` ADD FOREIGN KEY ( `request_setting_id` ) REFERENCES `request_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"    
    ActiveRecord::Base.connection.execute "ALTER TABLE `requests` ADD FOREIGN KEY ( `request_type_id` ) REFERENCES `request_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `requests` ADD FOREIGN KEY ( `point_id` ) REFERENCES `points` (`id`) ON DELETE SET NULL ON UPDATE CASCADE";
    ActiveRecord::Base.connection.execute "ALTER TABLE `requests` ADD FOREIGN KEY ( `bank_id` ) REFERENCES `banks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE";    

          #사용자
    ActiveRecord::Base.connection.execute "ALTER TABLE `user_point_counters` ADD FOREIGN KEY ( `id` ) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `user_referrals` ADD FOREIGN KEY ( `user_id` ) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `user_referrals` ADD FOREIGN KEY ( `recommend_user_id` ) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"    
    ActiveRecord::Base.connection.execute "ALTER TABLE `user_targets` ADD FOREIGN KEY ( `user_id` ) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `user_targets` ADD FOREIGN KEY ( `target_id` ) REFERENCES `targets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"    
    ActiveRecord::Base.connection.execute "ALTER TABLE `user_target_addresses` ADD FOREIGN KEY ( `user_id` ) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `user_target_addresses` ADD FOREIGN KEY ( `address_id` ) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    
           #  게시판
    ActiveRecord::Base.connection.execute "ALTER TABLE `notice_contents` ADD FOREIGN KEY ( `id` ) REFERENCES `notices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `faq_contents` ADD FOREIGN KEY ( `id` ) REFERENCES `faqs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    

    ActiveRecord::Base.connection.execute "ALTER TABLE `targets` ADD FOREIGN KEY ( `target_type_id` ) REFERENCES `target_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    
    
    ActiveRecord::Base.connection.execute "ALTER TABLE `store_good_pictures` ADD FOREIGN KEY ( `store_good_id` ) REFERENCES `store_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    
    ActiveRecord::Base.connection.execute "ALTER TABLE `store_orders` ADD FOREIGN KEY ( `store_good_id` ) REFERENCES `store_goods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `store_orders` ADD FOREIGN KEY ( `user_id` ) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE ;"                    
  end
end 
