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

  namespace :admin do
    resources :notices
    resources :faqs

    resources :users do
      resources :user_targets, :user_target_addresses, :user_referrals
      get 'user_id_select',:on=>:collection
      get 'user_id_select_search_result',:on=>:collection
    end

    resources :mobile_prefixes

    resources :user_address_books

    resources :quiz_logs
    resources :quiz_answers
    resources :quiz_questions
    resources :quizzes
    resources :quiz_addresses

    resources :roulette_settings
    resources :roulette_plays
    resources :roulette_games
    resources :roulette_play_addresses

    resources :coupon_types

    resources :operators

    resources :users do
      resources :user_targets, :user_target_addresses, :user_referrals
      get 'user_id_select',:on=>:collection
      get 'user_id_select_search_result',:on=>:collection
    end

    resources :user_address_books
    resources :user_login_logs
    resources :delete_users

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

    resources :coupon_types
    resources :address_sections
    resources :ad_comments
    resources :attendances
    resources :attendance_settings
    resources :devices
    resources :carriers
    resources :app_logs
    resources :app_log_types
    resources :store_order_statuses
    resources :ad_log_types
    resources :ad_logs
    resources :ad_daily_stats
    resources :markets do
      get 'market_id_select',:on=>:collection
      get 'market_id_select_search_result',:on=>:collection
    end

    resources :requests do
      post 'update_status',:on=>:collection
    end

    resources :stats
    resources :request_types
    resources :sponsors
    resources :point_types
    resources :points
    resources :game_amounts
    resources :game_settings
    resources :games
    resources :notices
    resources :faqs
    resources :banks
    resources :addresses  do
      get 'address_id_select',:on=>:collection
      get 'address_id_select_search_result',:on=>:collection
    end

    resources :target_types
    resources :targets

    resources :attendances
    resources :attendance_settings
    resources :attendance_pictures

    resources :roulette_settings
    resources :roulette_bettings
    resources :roulette_backgrounds
    resources :roulette_presents
    resources :roulette_plays
    resources :roulette_plays_user_address_books

    resources :quizzes do
      resources :quiz_questions do
        resources :quiz_answers
      end
    end

    resources :quiz_logs
    resources :quizzes_user_address_books

    get '/ad_files/publish', :to=> 'ad_files#publish'
    get '/no_auth', :to=> 'home#no_auth'

    resources :ad_file_types
    resources :store_orders

    resources :store_goods do
      resources :store_good_pictures
    end

    resources :sms_messages
    resources :messages
    resources :request_settings
    resources :application_versions

  end

end
