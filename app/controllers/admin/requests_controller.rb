# encoding: utf-8

class Admin::RequestsController < Admin::AdminController
  include Admin::SearchDate
  impressionist  
  load_and_authorize_resource
  skip_load_and_authorize_resource :only => :update_status  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_point)
    @sub_menu=t(:submenu_request)
    @controller_name=t('activerecord.models.request')  
  end
  
  # GET /requests
  # GET /requests.json
  def index
    if params[:user_id].present?
      @request_all=Request.sum(:amount,:conditions=>{:user_id=>params[:user_id]})
      @request_end=Request.sum(:amount,:conditions=>{:request_type_id=>2,:user_id=>params[:user_id]})
    else
      @request_all=Request.sum(:amount)
      @request_end=Request.sum(:amount,:conditions=>{:request_type_id=>2})
    end
    
    if params[:login_id].present? || params[:cell_phone].present?    
      likesql='1=1'
      likep=[]
    end
    
    if params[:login_id].present?
      likesql+=' AND users.username like ?'
      likep << '%'+params[:login_id]+'%'
    end
    
    if params[:cell_phone].present?
      likesql+=' AND users.mobile_num like ?'
      likep << '%'+params[:cell_phone]+'%'
    end
    
    unless params[:per_page].present?
      per_page=20        
    end
    
    if params[:format]=='xls'
      params[:page]=nil      
      per_page=50000
    end    
    
    
    conditions={}
    conditions[:user_id]=params[:user_id] if params[:user_id].present?
    conditions[:request_type_id]=params[:request_type_id] if params[:request_type_id].present?
    conditions[:request_setting_id]=params[:request_setting_id] if params[:request_setting_id].present?
    conditions[:bank_id]=params[:bank_id] if params[:bank_id].present?    
    
    if(likesql)
      @requests = Request.joins(:user).where(likesql,likep).where(conditions).where(:created_at => (change_date(params[:start_date],false))..(change_date(params[:end_date]))).order('requests.id desc').page(params[:page]).per(per_page)
    else 
      @requests = Request.order('requests.id desc').where(conditions).where(:created_at=>(change_date(params[:start_date],false))..(change_date(params[:end_date]))).page(params[:page]).per(per_page)
    end
    
    
    @script='requests/index'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.json
  def new
    @request = Request.new
    
    @script='requests/new'    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
    
    @script='requests/new'    
  end

  # POST /requests
  # POST /requests.json
  def create   
    @request = Request.new(params[:request])
    request_setting=RequestSetting.find(@request.request_setting_id)

    @request.transaction do
      point=Point.create!(:user_id=>@request.user_id, :point_type_id=>7, :amount=>request_setting.amount)
      
      @request.amount=request_setting.amount
      @request.point_id=point.id
      @s_save=@request.save
    end

    respond_to do |format|
      if @s_save
        format.html { redirect_to admin_request_path(@request), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @request, :status => :created, :location => @request }
      else
        format.html { render :action => "new" }
        format.json { render :json => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.json
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to admin_request_path(@request), :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @request.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  def update_status
    @requests = Request.find(params[:id])
    
    @requests.each do | request |
      request.update_attributes(:request_type_id=>params[:request_type_id])
    end 

    respond_to do |format|
      if true
        format.html { redirect_to requests_url, :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to admin_requests_path }
      format.json { head :no_content }
    end
  end
end
