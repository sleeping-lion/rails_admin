class Admin::AdminController < ApplicationController
  layout 'admin/application'
  load_and_authorize_resource 
  
 def index  
    # TODO: 데이터 증가에 따른 Memcache 처리 필요할듯
    
    @new_users_count = User.count(:conditions=>"DATE(created_at) = DATE( DATE_ADD( NOW(), INTERVAL - 1 DAY ) )")   
    @new_ads_count = Ad.where(:flag => 1).count(:conditions=>"DATE(created_at) >= DATE( DATE_ADD( NOW(), INTERVAL - 2 DAY ) )")   
    @new_orders_count = StoreOrder.where(:store_order_status_id => 1 ).count(:conditions=>"DATE(created_at) = DATE( DATE_ADD( NOW(), INTERVAL - 1 DAY ) )")   

    @daily_point_deposit=Point.where('amount>0').where('date(created_at)>date_add(curdate(),interval - 20 day)').group('date(created_at)').count
    @daily_point_use=Point.where('amount<0').where('date(created_at)>date_add(curdate(),interval - 20 day)').group('date(created_at)').count        
    
    @users_count=User.count
    #@users_active_count=User.joins(:user_point).count('users.id',:conditions=>"exists(select id from points where date(points.created_at)>date_add(curdate(),interval - 90 day))",:distinct => true)
    #@users_disable_count= @users_count-@users_active_count
    @users_disable_count = 2568
    @users_active_count = @users_count - @users_disable_count

    @users_active_point=Point.sum('amount',:conditions=>"exists(select id from points where date(points.created_at)>date_add(curdate(),interval - 7 day))") * 3
    @users_disable_point=Point.sum('amount',:conditions=>"not exists(select id from points where date(points.created_at)>date_add(curdate(),interval - 7 day))")

    @week_user_count=User.count(:conditions=>"date(created_at)>date_add(curdate(),interval - 7 day)")
    @daily_user=User.where('date(created_at)>date_add(curdate(),interval - 20 day)').group('date(created_at)').count
    
    @week_expose_count=AdDailyStat.where(:ad_log_type_id=>8).where("date>date_add(curdate(),interval - 7 day)").sum('log_count')
    @week_deposit_point_count=Point.where('amount>0').where("date(created_at)>date_add(curdate(),interval - 7 day)").sum('amount') * 3
    @week_use_point_count=Point.where('amount<0').where("date(created_at)>date_add(curdate(),interval - 7 day)").sum('amount') * 3
    
    #daily call_rec     
    @daily_call=AdDailyStat.where(:ad_log_type_id=>3).where('date>date_add(curdate(),interval - 20 day)').group('date').order('date desc').count('log_count')
    @daily_rec=AdDailyStat.where(:ad_log_type_id=>4).where('date>date_add(curdate(),interval - 20 day)').group('date').order('date desc').count('log_count')    
    
    #weekly call_rec
    @week_rec_sum=AdDailyStat.where(:ad_log_type_id=>3).where('date>date_add(curdate(),interval - 7 day)').sum('log_count')
    @week_call_sum=AdDailyStat.where(:ad_log_type_id=>4).where('date>date_add(curdate(),interval - 7 day)').sum('log_count')
    
    unless @week_rec_sum.zero?
      @week_rec_average=@week_rec_sum/7
    end
    
    unless @week_call_sum.zero?
      @week_call_average=@week_call_sum/7
    end
    
    @daily_active_user = Point.find_by_sql('SELECT date( d ) AS d , count( * ) as c
FROM (
  SELECT d, user_id
  FROM (
    SELECT date( created_at ) d, user_id
    FROM `points`
    WHERE 
      date( created_at ) > date_add( curdate( ) , INTERVAL -20 DAY )     
    GROUP BY date( created_at ), user_id
    
    UNION ALL 
  
    SELECT date( created_at ) d, user_id
    FROM `ad_logs`
    WHERE 
      date( created_at ) > date_add( curdate( ) , INTERVAL -20 DAY )     
    GROUP BY date( created_at ), user_id
  ) L
  GROUP BY d, user_id
) AS FF
GROUP BY d')
    
    @daily_limit_user=Point.find_by_sql('SELECT date( date_created_at ) AS d , count( * ) as c
FROM (
SELECT sum( `amount` ) AS `sum_point` , date( `created_at` ) AS date_created_at, user_id AS user_id
FROM `points`
WHERE 
  date( created_at ) > date_add( curdate( ) , INTERVAL -20 DAY ) 
GROUP BY date( created_at ) , user_id
HAVING sum( amount ) >15
) AS FF
GROUP BY date( date_created_at )')     
    
    @week_limit_user=Point.find_by_sql('SELECT count(*) AS count FROM (SELECT sum(`amount`) as `sum_point`, date(`created_at`) AS date_created_at, user_id AS user_id
FROM `points`
WHERE (
date( created_at ) > date_add( curdate( ) , INTERVAL -7
DAY )
)
GROUP BY date( created_at ) , user_id
HAVING sum( amount ) >15) AS FF')
    
    
    @script='home/index'
  end
  
  private

  def ensure_admin!
    unless current_user.admin?
      sign_out current_user

      redirect_to root_path

      return false
    end
  end
  
end