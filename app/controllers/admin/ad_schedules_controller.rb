# encoding: utf-8

class Admin::AdSchedulesController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_ad)
    @controller_name=t('activerecord.models.ad_schedule')
  end
  
  def edit
    @ad_schedule = AdSchedule.find(params[:id])
    @ad=@ad_schedule.ad
  end
  
  def create_dateparam(j_datetime,make_s)
    dt=j_datetime.split(' ')
    date=dt[0].split('/')
    time=dt[1].split(':')
    
    params[:ad_schedule][:"#{make_s}(1i)"]=date[2]
    params[:ad_schedule][:"#{make_s}(2i)"]=date[0]
    params[:ad_schedule][:"#{make_s}(3i)"]=date[1]
    params[:ad_schedule][:"#{make_s}(4i)"]=time[0]
    params[:ad_schedule][:"#{make_s}(5i)"]=time[1]   
  end
  
  def create
    @ad = Ad.find(params[:ad_id])
    
    unless params[:ad_schedule][:'start_time(1i)'].present?
      if params[:ad_schedule][:start_time].present?
        create_dateparam(params[:ad_schedule][:start_time],'start_time')                              
      end      
    end
    
    unless params[:ad_schedule][:'end_time(1i)'].present?
      if params[:ad_schedule][:end_time].present?
        create_dateparam(params[:ad_schedule][:end_time],'end_time')                            
      end      
    end
    
    unless params[:ad_schedule][:'expire_time(1i)'].present?
      if params[:ad_schedule][:expire_time].present?
        create_dateparam(params[:ad_schedule][:expire_time],'expire_time')                 
      end      
    end    
    
    
    
    @ad_schedule = @ad.ad_schedule.create(params[:ad_schedule])
    
    redirect_to ad_path(@ad)
  end
  
  def show 
    @ad_schedule  = AdSchedule.find(params[:id])
    @ad_targets = @ad_schedule.ad_target.order('target_id desc')
    @ad_target_addresses = @ad_schedule.ad_target_address.order('address_id desc')
    @ad_target_cids = @ad_schedule.ad_target_cid.order('cid desc') 
    
    @script='ad_schedules/show'
  end
  
  # DELETE /AdFiles/1
  # DELETE /AdFiles/1.json
  
  def update
    @ad_schedule = AdSchedule.find(params[:id])
    
    respond_to do |format|
      if @ad_schedule.update_attributes(params[:ad_schedule])
        format.html { redirect_to @ad_schedule.ad, :notice => @controller_name +t(:message_success_update) }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ad_schedule.errors, :status => :unprocessable_entity }
      end
    end
  end   
 
  # DELETE /ad/1/ad_schedule/1
  # DELETE /ad/1/ad_schedule/1.json
  
  def destroy
    @ad_schedule = AdSchedule.find(params[:id])
    @ad_schedule.destroy

    respond_to do |format|
      format.html { redirect_to ad_path(@ad_schedule.ad) }
      format.json { head :no_content }
    end
  end
end
