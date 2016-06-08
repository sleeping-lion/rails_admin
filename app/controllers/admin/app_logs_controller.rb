class Admin::AppLogsController < Admin::AdminController
  impressionist
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_app_log)    
    @controller_name=t('activerecord.models.app_log')
  end  
  
  # GET /app_logs
  # GET /app_logs.json
  def index
    unless params[:per_page].present?
      params[:per_page]=10        
    end 
    
    @app_logs = AppLog.order('id desc').page(params[:page]).per(params[:per_page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @app_logs }
    end
  end

  # GET /app_logs/1
  # GET /app_logs/1.json
  def show
    @app_log = AppLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @app_log }
    end
  end

  # GET /app_logs/new
  # GET /app_logs/new.json
  def new
    @app_log = AppLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @app_log }
    end
  end

  # GET /app_logs/1/edit
  def edit
    @app_log = AppLog.find(params[:id])
  end

  # POST /app_logs
  # POST /app_logs.json
  def create
    @app_log = AppLog.new(params[:app_log])

    respond_to do |format|
      if @app_log.save
        format.html { redirect_to admin_app_log_path(@app_log), :notice => 'App log was successfully created.' }
        format.json { render :json => @app_log, :status => :created, :location => @app_log }
      else
        format.html { render :action => "new" }
        format.json { render :json => @app_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /app_logs/1
  # PUT /app_logs/1.json
  def update
    @app_log = AppLog.find(params[:id])

    respond_to do |format|
      if @app_log.update_attributes(params[:app_log])
        format.html { redirect_to admin_app_log_path(@app_log), :notice => 'App log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @app_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /app_logs/1
  # DELETE /app_logs/1.json
  def destroy
    @app_log = AppLog.find(params[:id])
    @app_log.destroy

    respond_to do |format|
      format.html { redirect_to admin_app_logs_path }
      format.json { head :no_content }
    end
  end
end
