# encoding: utf-8

class Admin::UsersController < Admin::AdminController
  include Admin::SearchDate
  impressionist
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_user)
    @sub_menu=t(:submenu_user)
    @controller_name=t('activerecord.models.user')     
  end
  
  def user_id_select
    @script='users/user_id_select'
  end
  
  def user_id_select_search_result
    case params[:find_method]
      when 'login_id'
        condition_sql='username like ?'
      when 'email'
        condition_sql='email like ?'
      when 'user_id'
        condition_sql='id like ?'
      when 'market'
        condition_sql='market like ?'
    end
    
    unless params[:per_page].present?
      params[:per_page]=20
    end
    
    @user_count = User.order('id desc').where(condition_sql,'%'+params[:search].strip+'%').count    
    @users = User.order('id desc').where(condition_sql,'%'+params[:search].strip+'%').page(params[:page]).per(params[:per_page])

    @script='users/user_id_select'
    
    if(@user_count.zero?)
      a={:count=>@user_count}
    else
      a={:count=>@user_count,:list=>@users}
    end 
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => a }
      format.xls
    end        
  end  
 
  # GET /users
  # GET /users.json
  def index
    if params[:login_id].present? || params[:cell_phone].present?    
      likesql='1=1'
      likep=[]
    end
    
    unless params[:per_page].present?
      params[:per_page]=20
    end
    
    if params[:format]=='xls'
      params[:page]=nil
      params[:per_page]=500000  
    end
    
    conditions={}
    conditions[:user_id]=params[:user_id] if params[:user_id].present?
    conditions[:flag]=params[:flag] if params[:flag].present?
    

    @users = User.where('1=1')

    if params[:cell_phone].present?
      @users = @users.where('mobile_num like ?', params[:cell_phone].strip+'%')
    end
    if params[:login_id].present?
      @users = @users.where('username like ?', '%'+params[:login_id].strip+'%')
    end
    if params[:market].present?
      @users = @users.where('market like ?', params[:market].strip)
    end
    if params[:start_date].present? and params[:date_p] != 'false'
      @users = @users.where(:created_at => (change_date(params[:start_date],false))..(change_date(params[:end_date])))
    end
    @users = @users.order('id desc').page(params[:page]).per(params[:per_page])

    @users_count=User.count
    #@users_active_count=User.count(:conditions=>{:flag=>true})
    @users_disable_count=2568
    @users_active_count=@users_count - @users_disable_count
    @script='users/index'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.select('*,point as u_point').find(params[:id])
    @user_targets=@user.user_target.order('target_id desc').page(params[:page]).per(10)   
    @user_recommends=UserReferral.where(:recommend_user_id=>@user).order('recommend_user_id desc').page(params[:page]).per(10)  
    @user_target_address=@user.user_target_address
    @user_referral=@user.user_referral
    @script='users/show'    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new  
    @user = User.new
    
    @script='users/new'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    
    @script='users/new'    
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    require 'digest/md5'
    @user.device_id= Digest::MD5.hexdigest(User.random_string(10)).upcase

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
   @user=User.find(params[:id])
   @delete_user=DeleteUser.new({:username=>@user.username,:nickname=>@user.nickname,:email=>@user.email,:nation_num=>@user.nation_num,:mobile_num=>@user.mobile_num})
    
    @delete_user.transaction do
      @user.destroy
      @s_save=@delete_user.save!
    end

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
