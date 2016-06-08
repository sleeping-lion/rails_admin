class Admin::AdTargetsController < Admin::AdminController
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_ad)
    @controller_name=t('activerecord.models.ad_target')
  end  
  
  def edit
    @ad_target = AdTarget.find(params[:id])
    @ad_schedule=@ad_target.ad_schedule
  end
  
  def create
    @ad_schedule = AdSchedule.find(params[:ad_schedule_id])
    @ad_target = @ad_schedule.ad_target.create(params[:ad_target])
    
    redirect_to ad_ad_schedule_path(@ad_schedule.ad,@ad_schedule)
  end
  
  def update
    @ad_target = AdTarget.find(params[:id])
    
    respond_to do |format|
      if @ad_target.update_attributes(params[:ad_target])
        format.html { redirect_to [@ad_target.ad_schedule.ad,@ad_target.ad_schedule], :notice => @controller_name +t(:message_success_update) }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ad_target.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @ad_target = AdTarget.find(params[:id])
    @ad_target.destroy

    respond_to do |format|
      format.html { redirect_to ad_ad_schedule_path(@ad_target.ad_schedule.ad,@ad_target.ad_schedule)}
      format.json { head :no_content }
    end
  end
end
