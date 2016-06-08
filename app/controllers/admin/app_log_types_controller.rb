class Admin::AppLogTypesController < Admin::AdminController
  impressionist
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_app_log_type)    
    @controller_name=t('activerecord.models.app_log_type')
  end    
  
  # GET /app_log_types
  # GET /app_log_types.json
  def index
    unless params[:per_page].present?
      params[:per_page]=10        
    end 
    
    @app_log_types = AppLogType.order('id desc').page(params[:page]).per(params[:per_page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @app_log_types }
    end
  end

  # GET /app_log_types/1
  # GET /app_log_types/1.json
  def show
    @app_log_type = AppLogType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @app_log_type }
    end
  end

  # GET /app_log_types/new
  # GET /app_log_types/new.json
  def new
    @app_log_type = AppLogType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @app_log_type }
    end
  end

  # GET /app_log_types/1/edit
  def edit
    @app_log_type = AppLogType.find(params[:id])
  end

  # POST /app_log_types
  # POST /app_log_types.json
  def create
    @app_log_type = AppLogType.new(params[:app_log_type])

    respond_to do |format|
      if @app_log_type.save
        format.html { redirect_to admin_app_log_type_path(@app_log_type), :notice => 'App log type was successfully created.' }
        format.json { render :json => @app_log_type, :status => :created, :location => @app_log_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @app_log_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /app_log_types/1
  # PUT /app_log_types/1.json
  def update
    @app_log_type = AppLogType.find(params[:id])

    respond_to do |format|
      if @app_log_type.update_attributes(params[:app_log_type])
        format.html { redirect_to admin_app_log_type_path(@app_log_type), :notice => 'App log type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @app_log_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /app_log_types/1
  # DELETE /app_log_types/1.json
  def destroy
    @app_log_type = AppLogType.find(params[:id])
    @app_log_type.destroy

    respond_to do |format|
      format.html { redirect_to admin_app_log_types_path }
      format.json { head :no_content }
    end
  end
end
