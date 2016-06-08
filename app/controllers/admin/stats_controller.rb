class Admin::StatsController < Admin::AdminController
  include Admin::SearchDate
  load_and_authorize_resource
  skip_load_and_authorize_resource :only => [:all,:show]
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_stats)
    @sub_menu=t(:submenu_stats)
    @controller_name=t('activerecord.models.stats')
  end
  
  # GET /stats
  # GET /stats.json
  def index
    
    unless params[:per_page].present?
      params[:per_page]=20        
    end
    
    if params[:format]=='xls'
      params[:page]=nil      
      params[:per_page]=50000
    end
    
    case params[:type]
    when 'market'
      template='admin/stats/market'
      @sub_menu=t(:submenu_stat_market)
      @controller_name=t(:submenu_stat_market)
      @script='stats/index_market'      
      market  
    when 'user'
      template='admin/stats/user'
      @sub_menu=t(:submenu_stat_user)
      @controller_name=t(:submenu_stat_user)
      @script='stats/index_user'      
      user
    when 'receive'
      template='admin/stats/receive'  
      @sub_menu=t(:submenu_stat_receive)
      @controller_name=t(:submenu_stat_receive)
      @script='stats/index_ad'            
      app_and_banner(2)
    when 'receive_and_call'
      template='admin/stats/receive_and_call'     
      @sub_menu=t(:submenu_stat_receive_and_call)
      @controller_name=t(:submenu_stat_receive_and_call)
      @script='stats/index_ad'
      receive_and_call      
    when 'app'
      template='admin/stats/app_and_banner'
      @sub_menu=t(:submenu_stat_app)
      @controller_name=t(:submenu_stat_app)
      @script='stats/index_ad'      
      app_and_banner(6)
    when 'banner'
      template='admin/stats/app_and_banner'
      @sub_menu=t(:submenu_stat_banner)
      @controller_name=t(:submenu_stat_banner)
      @script='stats/index_ad'      
      app_and_banner(1)
    end
    
    respond_to do |format|
      format.html { render :template => template }
      format.json { render :json => @stats }
    end
  end
  
  # GET /stats/1
  # GET /stats/1.json
  def show
    @ad=Ad.find(params[:id])
  
    if(params[:period]=='month')
      @ad_daily_stats = AdDailyStat.select('*,month(date) as month_date').group('month(date)').where(:ad_id=>params[:id]).order('id desc').page(params[:page]).per(10)
    else    
      if(params[:period]=='week')
        @ad_daily_stats = AdDailyStat.select('*,week(date) as week_date').group('week(date)').where(:ad_id=>params[:id]).order('id desc').page(params[:page]).per(10)
      else
        @ad_daily_stats = AdDailyStat.group(:date).where(:ad_id=>params[:id]).order('id desc').page(params[:page]).per(10)
      end
    end
    
    @script='stats/show'
    
    
    if(@ad.ad_type_id==2) 
      template='stats/show'
      call_show
    else
      template='stats/show2'
      other_show
    end

    respond_to do |format|
      format.html { render :template => template }
      format.json { render :json => @ad_logs }     
    end
  end

  # GET /ad_log/new
  # GET /ad_log/new.json
  def new
    @ad_log = AdLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ad_log }
    end
  end

  # GET /ad_log/1/edit
  def edit
    @ad_log = AdLog.find(params[:id])
  end

  # POST /ad_log
  # POST /ad_log.json
  def create
    @ad_log = AdLog.new(params[:ad_log_type])

    respond_to do |format|
      if @ad_log.save
        format.html { redirect_to @ad_log, :notice =>  @controller_name +t(:message_success_insert)}
        format.json { render :json => @ad_log, :status => :created, :location => @ad_log }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ad_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ad_log/1
  # PUT /ad_log/1.json
  def update
    @ad_log = AdLog.find(params[:id])

    respond_to do |format|
      if @ad_log.update_attributes(params[:ad_log_type])
        format.html { redirect_to @ad_log, :notice => @controller_name +t(:message_success_insert)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ad_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_log/1
  # DELETE /ad_log/1.json
  def destroy
    @ad_log = AdLog.find(params[:id])
    @ad_log.destroy

    respond_to do |format|
      format.html { redirect_to ad_logs_url }
      format.json { head :no_content }
    end
  end
  
  private 
  
  
  def market
    if(params[:market_id])
      @markets=Market.select('title,count(*) AS count').group(:id).where(:id=>params[:market_id]).order('count desc').page(0).per(10)    
    else
      @markets=User.select('market as title,count(*) AS count').group(:market).order('count desc').page(0).per(10) 
    end
    
    if(params[:period]=='month')
      group='month(created_at)'      
      select='count(*) AS total_count,month(created_at) as period'
      
      @markets.each_with_index do |market,index|
          if market.title.nil?
            select+=",(select count(*) FROM `users` WHERE market is null AND month(created_at)=period) AS null_count"
          else
            select+=",(select count(*) FROM `users` WHERE market='#{market.title}' AND month(created_at)=period) AS #{market.title}_count"
          end
      end
      

    else
      if(params[:period]=='week')
        group='week(created_at)'
        select='count(*) AS total_count,week(created_at) as period'
        @markets.each_with_index do |market,index|
          if market.title.nil?
            select+=",(select count(*) FROM `users` WHERE market is null AND week(created_at)=period) AS null_count"
          else
            select+=",(select count(*) FROM `users` WHERE market='#{market.title}' AND week(created_at)=period) AS #{market.title}_count"
          end
        end
      else
        group='date(created_at)'        
        select='market,count(*) AS total_count,date(created_at) as period'
        @markets.each_with_index do |market,index|
          if market.title.nil?
            select+=",(select count(*) FROM `users` WHERE market is null AND date(created_at)=period) AS null_count"
          else
            select+=",(select count(*) FROM `users` WHERE market='#{market.title}' AND date(created_at)=period) AS #{market.title}_count"
          end
        end
      end
    end
        
    @stats = User.select(select).group(group).order('id desc').where(:created_at => (change_date(params[:start_date],false))..(change_date(params[:end_date]))).page(params[:page]).per(params[:per_page])
    
  end
  
  def user
    if(params[:period]=='month')
      select='month(created_at) as period,(select count(*) FROM `users` where mobile_num is not null AND month(created_at)=period) AS count_auth,(select count(*) FROM `users` where mobile_num is null AND month(created_at)=period) AS count_no_auth'
      group='month(created_at)'
    else
      if(params[:period]=='week')
        select='week(created_at) as period,(select count(*) FROM `users` where mobile_num is not null AND week(created_at)=period) AS count_auth,(select count(*) FROM `users` where mobile_num is null AND week(created_at)=period) AS count_no_auth'
        group='week(created_at)'
      else
        select='date(created_at) as period,(select count(*) FROM `users` where mobile_num is not null AND date(created_at)=period) AS count_auth,(select count(*) FROM `users` where mobile_num is null AND date(created_at)=period) AS count_no_auth'
        group='date(created_at)'
      end
    end
    
    @stats = User.select(select).group(group).order('id desc').where(:created_at => (change_date(params[:start_date],false))..(change_date(params[:end_date]))).page(params[:page]).per(params[:per_page])    
  end
  
  def receive(ad_type_id=2)
    unless params[:ad_id].blank?
      @ads=Ad.select('id,title').where(:ad_type_id=>ad_type_id).where(:id=>params[:ad_id]).page(0).per(6)
    else
      @ads=Ad.select('id,title').where(:ad_type_id=>ad_type_id).page(0).per(6)
    end
    
    if(params[:period]=='month')
        group='month(date),ad_log_type_id'
        select='sum(log_count) AS total_count,month(date) as period'
    else
      if(params[:period]=='week')
        group='week(date),ad_log_type_id'
        select='sum(log_count) AS total_count,week(date) as period'
      else
        group='date(date)'
        select='sum(log_count) AS total_count,date(date) as period'
      end
    end
    
    @ad_log_types.each_with_index do |ad_log_type,index|
      select+=", SUM( IF(ad_log_type_id = #{ad_log_type.id}, ad_log_type_id, 0) ) AS '#{ad_log_type.title}_count'"
    end
    
    
    if params[:ad_id].blank?
      @stats = AdDailyStat.joins(:ad).select(select).group(group).order('ad_daily_stats.id desc').where('ads.ad_type_id'=>params[:ad_type_id]).where(:date => (change_date(params[:start_date],false))..(change_date(params[:end_date]))).page(params[:page]).per(params[:per_page])
    else
      @stats = AdDailyStat.joins(:ad).select(select).group(group).order('ad_daily_stats.id desc').where('ads.ad_type_id'=>params[:ad_type_id]).where('ads.id'=>params[:ad_id]).where(:date => (change_date(params[:start_date],false))..(change_date(params[:end_date]))).page(params[:page]).per(params[:per_page])
    end        
  end
  
  def receive_and_call
    unless(params[:ad_log_type_id].blank? && params[:ad_log_type_id].to_i.integer?)
      @ad_log_types=AdLogType.select('id,title').where(:id=>params[:ad_log_type_id]).order('id desc').page(0).per(10)
    else
      @ad_log_types=AdLogType.select('id,title').where(:id=>[3,4]).order('id desc').page(0).per(10)
    end
    
    if(params[:period]=='month')
        group='month(date)'
        select='sum(log_count) AS total_count,month(date) as period'
    else
      if(params[:period]=='week')
        group='week(date)'
        select='sum(log_count) AS total_count,week(date) as period'
      else
        group='date(date)'
        select='sum(log_count) AS total_count,date(date) as period'
      end
    end
    
    @ad_log_types.each_with_index do |ad_log_type,index|
      select+=", SUM( IF(ad_log_type_id = #{ad_log_type.id}, ad_log_type_id, 0) ) AS '#{ad_log_type.title}_count'"
    end
    
    @stats = AdDailyStat.select(select).joins(:ad).group(group).order('ad_daily_stats.id desc').where('ads.ad_type_id'=>params[:ad_type_id]).where(:date => (change_date(params[:start_date],false))..(change_date(params[:end_date]))).page(params[:page]).per(params[:per_page])
  end
  
  
  def app_and_banner(ad_type_id=1)
    unless params[:ad_id].blank?
      @ads=Ad.select('id,title').where(:ad_type_id=>ad_type_id).where(:id=>params[:ad_id]).page(0).per(6)
    else
      @ads=Ad.select('id,title').where(:ad_type_id=>ad_type_id).page(0).per(6)
    end
    
    if(params[:period]=='month')
        group='month(date)'
        select='sum(log_count) AS total_count,month(date) as period'
    else
      if(params[:period]=='week')
        group='week(date)'
        select='sum(log_count) AS total_count,week(date) as period'
      else
        group='date(date)'
        select='sum(log_count) AS total_count,date(date) as period'
      end
    end
    
    @ads.each_with_index do |ad,index|
      select+=", SUM( IF(ad_id = #{ad.id}, ad_id, 0) ) AS '#{ad.title}_count'"
    end
    
    if params[:ad_log_type_id].blank?
      @stats = AdDailyStat.joins(:ad).select(select).group(group).order('ad_daily_stats.id desc').where('ads.ad_type_id'=>params[:ad_type_id]).where('ad_daily_stats.ad_log_type_id'=>8).where(:date => (change_date(params[:start_date],false))..(change_date(params[:end_date]))).page(params[:page]).per(params[:per_page])
    else 
      @stats = AdDailyStat.joins(:ad).select(select).group(group).order('ad_daily_stats.id desc').where('ads.ad_type_id'=>params[:ad_type_id]).where('ad_daily_stats.ad_log_type_id'=>params[:ad_log_type_id]).where('ads.ad_type_id'=>params[:ad_type_id]).where(:date => (change_date(params[:start_date],false))..(change_date(params[:end_date]))).page(params[:page]).per(params[:per_page])
    end
  end
end
