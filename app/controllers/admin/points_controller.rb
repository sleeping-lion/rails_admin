class Admin::PointsController < Admin::AdminController
  include Admin::SearchDate
  impressionist
  load_and_authorize_resource
  skip_load_and_authorize_resource :only => :index  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_point)
    @sub_menu=t(:submenu_point)
    @controller_name=t('activerecord.models.point')
  end
     
  
  # GET /points
  # GET /points.json
  def index
    if params[:user_id].present?
      @point_all=Point.sum(:amount,:conditions=>{:user_id=>params[:user_id]})    
    else
      @point_all=Point.sum(:amount)
    end
   # @point_minus=Point.sum(:amount,:conditions=>'amount>0')
   
    if params[:login_id].present? || params[:cell_phone].present?    
      likesql='1=1'
      likep=[]
    end
    
    if params[:login_id].present?
      likesql+=' AND users.username like ?'
      likep << '%'+params[:login_id].strip+'%'
    end
    
    if params[:cell_phone].present?
      likesql+=' AND users.mobile_num like ?'
      likep << '%'+params[:cell_phone].strip+'%'
    end
    
    unless params[:per_page].present?
      params[:per_page]=20        
    end
   
    conditions={}
    conditions[:user_id]=params[:user_id] if params[:user_id].present?
    conditions[:point_type_id]=params[:point_type_id] if params[:point_type_id].present?
    
    if(likesql)
      @points = Point.joins(:user).where(likesql,likep).where(conditions).where(:created_at=>(change_date(params[:start_date],false))..(change_date(params[:end_date]))).order('points.id desc').page(params[:page]).per(params[:per_page])
    else 
      @points = Point.order('id desc').where(conditions).where(:created_at=>(change_date(params[:start_date],false))..(change_date(params[:end_date]))).page(params[:page]).per(params[:per_page])
    end    
    
    #@points = Point.order('id desc').page(params[:page]).per(10)
    @script='points/index'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @points }
    end
  end

  # GET /points/1
  # GET /points/1.json
  def show
    @point = Point.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @point }
    end
  end

  # GET /points/new
  # GET /points/new.json
  def new  
    @point = Point.new
    
    @script='points/new'    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @point }
    end
  end

  # GET /points/1/edit
  def edit
    @point = Point.find(params[:id])
    
    @script='points/new'    
  end

  # POST /points
  # POST /points.json
  def create
    @point = Point.new(params[:point])
    
    @point.transaction do     
      @save_result=@point.save
      
      if(params[:ad_id].present?)
        PointsAd.create(:ad_id=>params[:ad_id],:point_id=>@point.id)
      end 
    end

    respond_to do |format|
      if @save_result
        format.html { redirect_to @point, :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @point, :status => :created, :location => @point }
      else
        format.html { render :action => "new" }
        format.json { render :json => @point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /points/1
  # PUT /points/1.json
  def update
    @point = Point.find(params[:id])

    respond_to do |format|
      if @point.update_attributes(params[:point])
        format.html { redirect_to @point, :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /points/1
  # DELETE /points/1.json
  def destroy
    @point = Point.find(params[:id])
    @point.destroy

    respond_to do |format|
      format.html { redirect_to points_url }
      format.json { head :no_content }
    end
  end
end
