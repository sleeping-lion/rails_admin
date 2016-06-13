class Admin::AttendanceController < Admin::AdminController
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_attendance)
    @controller_name=t('activerecord.models.attendance_event_prize')
  end
  
  # GET /attendance_settings
  # GET /attendance_settings.json
  def index
    unless params[:per_page].present?
      params[:per_page]=10        
    end
    
    if params[:format]=='xls'
      params[:page]=nil 
      params[:per_page]=50000  
    end    
    
    @attendance_settings = AttendanceSetting.order('id desc').page(params[:page]).per(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendance_settings }     
    end
  end

  # GET /attendance_settings/1
  # GET /attendance_settings/1.json
  def show
    @attendance_setting = AttendanceSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendance_setting }
    end
  end

  # GET /attendance_settings/new
  # GET /attendance_settings/new.json
  def new
    @attendance_setting = AttendanceSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendance_setting }
    end
  end

  # GET /attendance_settings/1/edit
  def edit
    @attendance_setting = AttendanceSetting.find(params[:id])
  end

  # POST /attendance_settings
  # POST /attendance_settings.json
  def create
    @attendance_setting = AttendanceSetting.new(params[:attendance_setting])

    respond_to do |format|
      if @attendance_setting.save
        format.html { redirect_to admin_attendance_setting_path(@attendance_setting), :notice =>  @controller_name +t(:message_success_insert)}
        format.json { render json: @attendance_setting, status: :created, location: @attendance_setting }
      else
        format.html { render action: "new" }
        format.json { render json: @attendance_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendance_settings/1
  # PUT /attendance_settings/1.json
  def update
    @attendance_setting = AttendanceSetting.find(params[:id])

    respond_to do |format|
      if @attendance_setting.update_attributes(params[:attendance_setting])
        format.html { redirect_to admin_attendance_setting_path(@attendance_setting), :notice =>  @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendance_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendance_settings/1
  # DELETE /attendance_settings/1.json
  def destroy
    @attendance_setting = AttendanceSetting.find(params[:id])
    @attendance_setting.destroy

    respond_to do |format|
      format.html { redirect_to admin_attendance_settings_path }
      format.json { head :no_content }
    end
  end
end
