Rails.application.routes.draw do
  root :to => 'home#index'
  devise_for :admins, :controllers => { :sessions => "admins/sessions",:registrations => "admins/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do
    get '/admins', :to => 'admins::Registrations#index'
    get 'edit', :to => 'admins::Registrations#edit'
    get 'login', :to => 'admins::Sessions#new'
    get 'logout', :to=> 'admins::Sessions#destroy'
  end

  resources :notices
  resources :faqs
  
  resources :users do
    resources :user_targets, :user_target_addresses, :user_referrals
    get 'user_id_select',:on=>:collection
    get 'user_id_select_search_result',:on=>:collection
  end  

  namespace :admin do
    get '/' => 'admin#index'    
    resources :notices
    resources :faqs
    
    resources :operators
    resources :users do
      resources :user_targets, :user_target_addresses, :user_referrals
      get 'user_id_select',:on=>:collection
      get 'user_id_select_search_result',:on=>:collection
    end
    resources :user_address_books
    resources :user_login_logs
    resources :delete_users    
    
    resources :app_logs
    resources :app_log_types
    resources :app_versions
    resources :app_markets do
      get 'market_id_select',:on=>:collection
      get 'market_id_select_search_result',:on=>:collection
    end
    
    resources :attendances
    resources :attendance_settings
    resources :attendance_pictures 
    
    resources :roulette_settings
    resources :roulette_bettings
    resources :roulette_backgrounds
    resources :roulette_presents
    resources :roulette_plays
    resources :roulette_plays_user_address_books
       
    resources :mobile_prefixes
    resources :quizzes do
      resources :quiz_questions do
        resources :quiz_answers
      end
    end

    resources :quiz_logs
    resources :quizzes_user_address_books    
    resources :quiz_logs
    resources :quiz_addresses
  
    resources :coupon_types

    resources :ad_types
    resources :ads do
      resources :ad_schedules do
        resources :ad_targets, :ad_target_addresses, :ad_target_cids
      end

      resources :ad_files
      resources :ad_users

      get 'ad_id_select',:on=>:collection
      get 'ad_id_select_search_result',:on=>:collection
    end
    resources :ad_log_types
    resources :ad_logs
    resources :ad_daily_stats
    resources :ad_comments
    resources :ad_file_types
    
    resources :address_sections
    resources :addresses  do
      get 'address_id_select',:on=>:collection
      get 'address_id_select_search_result',:on=>:collection
    end    
    resources :devices
    resources :carriers


    resources :request_settings    
    resources :request_types
    resources :requests do
      post 'update_status',:on=>:collection
    end

    resources :stats
    resources :sponsors
    resources :point_types
    resources :points
    resources :banks


    resources :target_types
    resources :targets

    get '/ad_files/publish', :to=> 'ad_files#publish'
    get '/no_auth', :to=> 'home#no_auth'


    resources :store_orders
    resources :store_goods do
      resources :store_good_pictures
    end
    resources :store_order_statuses
    
    resources :sms_messages
    resources :messages

  end

end
