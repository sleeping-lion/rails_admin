class Admin::AppVersionsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_app_version)
    @controller_name=t('activerecord.models.application_version')
  end
  
  # GET /bank
  # GET /bank.json
  def index
    @app_versions = AppVersion.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @app_versions }
    end
  end

  # GET /bank/1
  # GET /bank/1.json
  def show
    @app_version = AppVersion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @app_version }
    end
  end

  # GET /bank/new
  # GET /bank/new.json
  def new
  
    @app_version = AppVersion.new
    @script='boards/new'  
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @app_version }
    end
  end

  # GET /bank/1/edit
  def edit
    @app_version = AppVersion.find(params[:id])
  end

  # POST /bank
  # POST /bank.json
  def create
    @app_version = AppVersion.new(params[:application_version])

    respond_to do |format|
      if @app_version.save
        format.html { redirect_to admin_app_version_path(@app_version), :notice => @controller_name +t(:message_success_insert)  }
        format.json { render :json => @app_version, :status => :created, :location => @application }
      else
        format.html { render :action => "new" }
        format.json { render :json => @app_version.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bank/1
  # PUT /bank/1.json
  def update
    @app_version = AppVersion.find(params[:id])

    respond_to do |format|
      if @app_version.update_attributes(params[:application_version])
        format.html { redirect_to admin_app_version_path(@app_version), :notice => @controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @app_version.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bank/1
  # DELETE /bank/1.json
  def destroy
    @app_version = AppVersion.find(params[:id])
    @app_version.destroy

    respond_to do |format|
      format.html { redirect_to admin_app_versions_path }
      format.json { head :no_content }
    end
  end
end
