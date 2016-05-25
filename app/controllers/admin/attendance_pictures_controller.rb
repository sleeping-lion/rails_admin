# encoding: utf-8

class Admin::AttendancePicturesController < Admin::AdminController
  impressionist
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_attendance) 
    @controller_name=t('activerecord.models.attendance_picture')
  end
  
  def index
    unless params[:per_page].present?
      params[:per_page]=10        
    end
    
    if params[:format]=='xls'
      params[:page]=nil 
      params[:per_page]=50000  
    end    
    
    @attendance_pictures = AttendancePicture.order('id desc').page(params[:page]).per(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendances }
      format.xls      
    end
  end
  
  def edit
    @attendance_picture = AttendancePicture.find(params[:id])
  end
  
  def show
    @attendance_picture = AttendancePicture.find(params[:id])
  end  
  
  def create  
    @attendance_picture = AttendancePicture.create(params[:attendance_picture])
    
    redirect_to attendance_picture_path(@attendance_picture)
  end
  
  def update
    @attendance_picture = AttendancePicture.find(params[:id])
    
    respond_to do |format|
      if @attendance_picture.update_attributes(params[:attendance_picture])
        format.html { redirect_to attendance_pictures_path, :notice => @controller_name +t(:message_success_insert)}
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @attendance_picture.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @attendance_picture = AttendancePicture.find(params[:id])
    @attendance_picture.destroy

    respond_to do |format|
      format.html { redirect_to attendance_pictures_path }
      format.json { head :no_content }
    end
  end
end
