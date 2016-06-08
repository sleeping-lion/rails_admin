class Admin::StoreGoodPicturesController < Admin::AdminController
  impressionist
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_sponsor) 
    @controller_name=t('activerecord.models.store_good_picture')
  end  
  
  def edit
    @store_good_picture = StoreGoodPicture.find(params[:id])
  end
  
  def show
    @store_good = StoreGood.find(params[:id])
  end  
  
  def create
    @store_good = StoreGood.find(params[:store_good_id])    
    @store_good_picture = @store_good.store_good_picture.create(params[:store_good_picture])
    
    redirect_to store_good_path(@store_good)
  end
  
  def update
    @store_good_picture = StoreGoodPicture.find(params[:id])
    
    respond_to do |format|
      if @store_good_picture.update_attributes(params[:store_good_picture])
        format.html { redirect_to @store_good_picture.store_good, :notice => @controller_name +t(:message_success_insert)}
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @store_good_picture.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @store_good_picture = StoreGoodPicture.find(params[:id])
    @store_good_picture.destroy

    respond_to do |format|
      format.html { redirect_to store_good_path(@store_good_picture.store_good) }
      format.json { head :no_content }
    end
  end
end
