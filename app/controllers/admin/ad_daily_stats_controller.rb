class Admin::AdDailyStatsController < Admin::AdminController
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_stats)
    @sub_menu=t(:submenu_stats)
    @controller_name=t('activerecord.models.ad_daily_stat') 
  end
  
  def change_date(dd,end_date=true)
    if(dd.to_s.length > 0 )
      dda=dd.split('/')
    else 
      dda = ''
    end
    
    if(dda.length!=3)
      if(end_date)
        return Time.now.to_date
      else
        return '1971-01-01'.to_date
      end
    end    
      
    dda=dd.split('/')
    
    if(end_date)
      aa="#{dda[2]}-#{dda[0]}-#{dda[1]}".to_date
      @end_date=dd;
      return "#{aa} 23:59:59"
    else
      @start_date=dd;
      return "#{dda[2]}-#{dda[0]}-#{dda[1]}".to_date
    end
  end  
  
  # GET /ad_log
  # GET /ad_log.json
  def index
    if params[:ad_name].present? 
      likesql='1=1'
      likep=[]
    end
    
    if params[:ad_name].present?
      likesql+=' AND ads.title like ?'
      likep << '%'+params[:ad_name]+'%'
    end
    
    unless params[:per_page].present?
      per_page=10        
    end
    
    if params[:format]=='xls'
      params[:page]=nil 
      per_page=50000  
    end 
   
   
    conditions={}
    conditions[:ad_id]=params[:ad_id] if params[:ad_id].present?
    conditions[:ad_log_type_id]=params[:ad_log_type_id] if params[:ad_log_type_id].present?
    
    
    if(likesql)
      @ad_daily_stats = AdDailyStat.joins(:ad).where(likesql,likep).where(conditions).where(:date => (change_date(params[:start_date],false))..(change_date(params[:end_date]))).order('ad_daily_stats.id desc').page(params[:page]).per(per_page)
    else
      @ad_daily_stats = AdDailyStat.order('id desc').where(conditions).page(params[:page]).per(per_page)
    end    
    
    @script='ad_daily_stats/index'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ad_daily_stats }
      format.xls      
    end
  end
  
  # DELETE /ad_log/1
  # DELETE /ad_log/1.json
  def destroy
    @ad_daily_stat = AdDailyStat.find(params[:id])
    @ad_daily_stat.destroy

    respond_to do |format|
      format.html { redirect_to ad_daily_stats_url }
      format.json { head :no_content }
    end
  end  
end  