class Admin::AttendancesController < Admin::AdminController
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_attendance)
    @controller_name=t('activerecord.models.attendance')
  end  
  
  # GET /attendances
  # GET /attendances.json
  def index
    unless params[:per_page].present?
      params[:per_page]=10        
    end
   
    @attendances = Attendance.order('id desc').page(params[:page]).per(params[:page])

    filename = "data_users.xls"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendances } 
    end
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.json
  def new
    @attendance = Attendance.new    
    @script='attendances/new'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/1/edit
  def edit
    @attendance = Attendance.find(params[:id])
    @script='attendances/new'    
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(params[:attendance])

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to admin_attendance_path(@attendance), :notice =>  @controller_name +t(:message_success_insert)}
        format.json { render json: @attendance, status: :created, location: @attendance }
      else
        format.html { render action: "new" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendances/1
  # PUT /attendances/1.json
  def update
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      if @attendance.update_attributes(params[:attendance])
        format.html { redirect_to admin_attendance_path(@attendance), :notice =>  @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to admin_attendances_path }
      format.json { head :no_content }
    end
  end
end
