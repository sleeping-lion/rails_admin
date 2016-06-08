class Admin::AdTargetCidsController < Admin::AdminController
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_ad)
    @controller_name=t('activerecord.models.ad_target_cid')
  end  
  
  def edit
    @ad_target_cid = AdTargetCid.find(params[:id])
    @ad_schedule=@ad_target_cid.ad_schedule
  end
  
  def create
    @ad_schedule = AdSchedule.find(params[:ad_schedule_id])
    @ad_target_cid = @ad_schedule.ad_target_cid.create(params[:ad_target_cid])
    
    redirect_to ad_ad_schedule_path(@ad_schedule.ad,@ad_schedule)
  end
  
  def update
    @ad_target_cid = AdTargetCid.find(params[:id])
    
    respond_to do |format|
      if @ad_target_cid.update_attributes(params[:ad_target_cid])
        format.html { redirect_to [@ad_target_cid.ad_schedule.ad,@ad_target_cid.ad_schedule], :notice => @controller_name +t(:message_success_update)}
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ad_target_cid.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @ad_target_cid = AdTargetCid.find(params[:id])
    @ad_target_cid.destroy

    respond_to do |format|
      format.html { redirect_to ad_ad_schedule_path(@ad_target_cid.ad_schedule.ad,@ad_target_cid.ad_schedule)}
      format.json { head :no_content }
    end
  end
end
