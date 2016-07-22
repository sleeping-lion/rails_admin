class Admin::AttendanceEventsController < Admin::AdminController
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_attendance)
    @controller_name=t('activerecord.models.attendance_event')
  end
  
  # GET /attendance_settings
  # GET /attendance_settings.json
  def index    
    @attendance_events = AttendanceEvent.order('id desc').page(params[:page]).per(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendance_event } 
    end
  end

  # GET /attendance_settings/1
  # GET /attendance_settings/1.json
  def show
    @attendance_event = AttendanceEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendance_event }
    end
  end

  # GET /attendance_settings/new
  # GET /attendance_settings/new.json
  def new
    @attendance_event = AttendanceEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendance_event }
    end
  end

  # GET /attendance_settings/1/edit
  def edit
    @attendance_event = AttendanceEvent.find(params[:id])
  end

  # POST /attendance_settings
  # POST /attendance_settings.json
  def create
    @attendance_event = AttendanceEvent.new(params[:attendance_event])

    respond_to do |format|
      if @attendance_event.save
        format.html { redirect_to admin_attendance_event_path(@attendance_event), :notice =>  @controller_name +t(:message_success_insert)}
        format.json { render json: @attendance_event, status: :created, location: @attendance_event }
      else
        format.html { render action: "new" }
        format.json { render json: @attendance_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendance_settings/1
  # PUT /attendance_settings/1.json
  def update
    @attendance_event = AttendanceEvent.find(params[:id])

    respond_to do |format|
      if @attendance_event.update_attributes(params[:attendance_event])
        format.html { redirect_to admin_attendance_event_path(@attendance_event), :notice =>  @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendance_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendance_settings/1
  # DELETE /attendance_settings/1.json
  def destroy
    @attendance_event = AttendanceEvent.find(params[:id])
    @attendance_event.destroy

    respond_to do |format|
      format.html { redirect_to admin_attendance_events_path }
      format.json { head :no_content }
    end
  end
end
