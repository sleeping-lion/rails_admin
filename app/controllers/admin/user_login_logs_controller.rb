# encoding: utf-8

class Admin::UserLoginLogsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_user)
    @sub_menu=t(:submenu_user_login_log)
    @controller_name=t('activerecord.models.user_log')
  end  
  
  # GET /user_login_logs
  # GET /user_login_logs.json
  def index
    unless params[:per_page].present?
      per_page=10        
    end
    
    if params[:format]=='xls'
      params[:page]=nil 
      per_page=50000  
    end
    
    @user_login_logs = UserLoginLog.order('id desc').page(params[:page]).per(per_page)
    
    @script='user_login_logs/index'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @user_login_logs }
      format.csv { send_data @user_login_logs.to_csv }
    end
  end

  # GET /user_login_logs/1
  # GET /user_login_logs/1.json
  def show
    @user_login_log = UserLoginLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user_login_log }
    end
  end

  # GET /user_login_logs/new
  # GET /user_login_logs/new.json
  def new
    @user_login_log = UserLoginLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user_login_log }
    end
  end

  # GET /user_login_logs/1/edit
  def edit
    @user_login_log = UserLoginLog.find(params[:id])
  end

  # POST /user_login_logs
  # POST /user_login_logs.json
  def create
    @user_login_log = UserLoginLog.new(params[:user_login_log])

    respond_to do |format|
      if @user_login_log.save
        format.html { redirect_to admin_user_login_log_path(@user_login_log), :notice =>  @controller_name +t(:message_success_insert)}
        format.json { render :json => @user_login_log, :status => :created, :location => @user_login_log }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user_login_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_login_logs/1
  # PUT /user_login_logs/1.json
  def update
    @user_login_log = UserLoginLog.find(params[:id])

    respond_to do |format|
      if @user_login_log.update_attributes(params[:user_login_log])
        format.html { redirect_to admin_user_login_log_path(@user_login_log), :notice =>  @controller_name +t(:message_success_insert)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user_login_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_login_logs/1
  # DELETE /user_login_logs/1.json
  def destroy
    @user_login_log = UserLoginLog.find(params[:id])
    @user_login_log.destroy

    respond_to do |format|
      format.html { redirect_to admin_user_login_logs_path }
      format.json { head :no_content }
    end
  end
end
