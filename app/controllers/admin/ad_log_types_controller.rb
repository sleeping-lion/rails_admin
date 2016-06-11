class Admin::AdLogTypesController < Admin::AdminController
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_ad_log_type)    
    @controller_name=t('activerecord.models.ad_log_type')    
  end  
  
  # GET /ad_log_types
  # GET /ad_log_types.json
  def index
    @ad_log_types = AdLogType.order('id desc').page(params[:page]).per(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ad_log_types }
    end
  end

  # GET /ad_log_types/1
  # GET /ad_log_types/1.json
  def show
    @ad_log_type = AdLogType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ad_log_type }
    end
  end

  # GET /ad_log_types/new
  # GET /ad_log_types/new.json
  def new
    @ad_log_type = AdLogType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ad_log_type }
    end
  end

  # GET /ad_log_types/1/edit
  def edit
    @ad_log_type = AdLogType.find(params[:id])
  end

  # POST /ad_log_types
  # POST /ad_log_types.json
  def create
    @ad_log_type = AdLogType.new(params[:ad_log_type])

    respond_to do |format|
      if @ad_log_type.save
        format.html { redirect_to admin_ad_log_type_path(@ad_log_type), :notice =>  @controller_name +t(:message_success_insert)}
        format.json { render :json => @ad_log_type, :status => :created, :location => @ad_log_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ad_log_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ad_log_types/1
  # PUT /ad_log_types/1.json
  def update
    @ad_log_type = AdLogType.find(params[:id])

    respond_to do |format|
      if @ad_log_type.update_attributes(params[:ad_log_type])
        format.html { redirect_to admin_ad_log_type_path(@ad_log_type), :notice =>  @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ad_log_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_log_types/1
  # DELETE /ad_log_types/1.json
  def destroy
    @ad_log_type = AdLogType.find(params[:id])
    @ad_log_type.destroy

    respond_to do |format|
      format.html { redirect_to admin_ad_log_types_path }
      format.json { head :no_content }
    end
  end
end
