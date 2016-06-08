class Admin::RequestSettingsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_request_setting)    
    @controller_name=t('activerecord.models.request_setting')
  end  
  
  # GET /request_settings
  # GET /request_settings.json
  def index
    
    
    @request_settings = RequestSetting.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @request_settings }
    end
  end

  # GET /request_settings/1
  # GET /request_settings/1.json
  def show
    @request_setting = RequestSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @request_setting }
    end
  end

  # GET /request_settings/new
  # GET /request_settings/new.json
  def new
    @request_setting = RequestSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @request_setting }
    end
  end

  # GET /request_settings/1/edit
  def edit
    @request_setting = RequestSetting.find(params[:id])
  end

  # POST /request_settings
  # POST /request_settings.json
  def create
    @request_setting = RequestSetting.new(params[:request_setting])

    respond_to do |format|
      if @request_setting.save
        format.html { redirect_to admin_request_setting_path(@request_setting), :notice =>@controller_name +t(:message_success_insert)}
        format.json { render :json => @request_setting, :status => :created, :location => @request_setting }
      else
        format.html { render :action => "new" }
        format.json { render :json => @request_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /request_settings/1
  # PUT /request_settings/1.json
  def update
    @request_setting = RequestSetting.find(params[:id])

    respond_to do |format|
      if @request_setting.update_attributes(params[:request_setting])
        format.html { redirect_to admin_request_setting_path(@request_setting), :notice =>@controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @request_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /request_settings/1
  # DELETE /request_settings/1.json
  def destroy
    @request_setting = RequestSetting.find(params[:id])
    @request_setting.destroy

    respond_to do |format|
      format.html { redirect_to admin_request_settings_path }
      format.json { head :no_content }
    end
  end
end
