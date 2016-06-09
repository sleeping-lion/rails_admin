class Admin::PointTypesController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_point_type)
    @controller_name=t('activerecord.models.point_type')
  end   
  
  # GET /point_types
  # GET /point_types.json
  def index
    @point_types = PointType.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @point_types }
    end
  end

  # GET /point_types/1
  # GET /point_types/1.json
  def show
    @point_type = PointType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @point_type }
    end
  end

  # GET /point_types/new
  # GET /point_types/new.json
  def new
    @point_type = PointType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @point_type }
    end
  end

  # GET /point_types/1/edit
  def edit
    @point_type = PointType.find(params[:id])
  end

  # POST /point_types
  # POST /point_types.json
  def create
    @point_type = PointType.new(params[:point_type])

    respond_to do |format|
      if @point_type.save
        format.html { redirect_to admin_point_type_path(@point_type), :notice => @controller_name +t(:message_success_insert)  }
        format.json { render :json => @point_type, :status => :created, :location => @point_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @point_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /point_types/1
  # PUT /point_types/1.json
  def update
    @point_type = PointType.find(params[:id])

    respond_to do |format|
      if @point_type.update_attributes(params[:point_type])
        format.html { redirect_to admin_point_type_path(@point_type), :notice => @controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @point_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /point_types/1
  # DELETE /point_types/1.json
  def destroy
    @point_type = PointType.find(params[:id])
    @point_type.destroy

    respond_to do |format|
      format.html { redirect_to admin_point_types_path }
      format.json { head :no_content }
    end
  end
end
