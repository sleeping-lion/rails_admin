# encoding: utf-8

class Admin::AdLogsController < Admin::AdminController
  impressionist
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_stats)
    @sub_menu=t(:submenu_stats)
    @controller_name=t('activerecord.models.ad_log')   
  end
  
  # GET /ad_log
  # GET /ad_log.json
  def index
    @ad_logs = AdLog.order('id desc').page(params[:page]).per(20)
    
    if params[:ad_name].present? 
      likesql='1=1'
      likep=[]
    end
    
    if params[:ad_name].present?
      likesql+=' AND ads.title like ?'
      likep << '%'+params[:ad_name]+'%'
    end
    
    unless params[:per_page].present?
      per_page=20        
    end
    
    if params[:format]=='xls'
      params[:page]=nil 
      per_page=50000  
    end   
   
   
    conditions={}
    conditions[:ad_id]=params[:ad_id] if params[:ad_id].present?
    conditions[:ad_log_type_id]=params[:ad_log_type_id] if params[:ad_log_type_id].present?
    
    
    if(likesql)
      @ad_logs = AdLog.joins(:ad).where(likesql,likep).where(conditions).order('games.id desc').page(params[:page]).per(per_page)
    else 
      @ad_logs = AdLog.order('id desc').where(conditions).page(params[:page]).per(per_page)
    end     
    
    @script='ad_logs/index'    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ad_log }
      format.xls  
    end
  end

  # GET /ad_log/1
  # GET /ad_log/1.json
  def show
    @ad_log = AdLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ad_log }
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
        format.html { redirect_to @ad_log, :notice => 'Ad log type was successfully created.' }
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
        format.html { redirect_to @ad_log, :notice => 'Ad log type was successfully updated.' }
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
end
