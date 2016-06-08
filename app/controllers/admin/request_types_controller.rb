class Admin::RequestTypesController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_request_type)    
    @controller_name=t('activerecord.models.request_type')
  end  
  
  # GET /point_types
  # GET /point_types.json
  def index
    unless params[:per_page].present?
      params[:per_page]=10        
    end
    
    @request_types = RequestType.order('id desc').page(params[:page]).per(params[:per_page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @request_types }
    end
  end

  # GET /point_types/1
  # GET /point_types/1.json
  def show
    @request_type = RequestType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @request_type }
    end
  end

  # GET /point_types/new
  # GET /point_types/new.json
  def new
    @request_type = RequestType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @request_type }
    end
  end

  # GET /point_types/1/edit
  def edit
    @request_type = RequestType.find(params[:id])
  end

  # POST /point_types
  # POST /point_types.json
  def create
    @request_type = RequestType.new(params[:request_type])

    respond_to do |format|
      if @request_type.save
        format.html { redirect_to admin_request_type_path(@request_type), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @request_type, :status => :created, :location => @request_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @request_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /point_types/1
  # PUT /point_types/1.json
  def update
    @request_type = RequestType.find(params[:id])

    respond_to do |format|
      if @request_type.update_attributes(params[:request_type])
        format.html { redirect_to admin_request_type_path(@request_type), :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @request_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /point_types/1
  # DELETE /point_types/1.json
  def destroy
    @request_type = RequestType.find(params[:id])
    @request_type.destroy

    respond_to do |format|
      format.html { redirect_to admin_request_types_path }
      format.json { head :no_content }
    end
  end
end
