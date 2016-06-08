class Admin::UserTargetAddressesController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_user)
    @sub_menu=t(:submenu_user)
    @controller_name=t('activerecord.models.user_target_address')
  end  
  
  def edit
    @user_target_address = UserTargetAddress.find(params[:id])
    @user=@user_target_address.user
  end
  
  def create
    @user = User.find(params[:user_id])
    @user.build_user_target_address(params[:user_target_address])
    @user.save    
    
    redirect_to admin_user_path(@user)
  end
  
  def update
    @user_target_address = UserTargetAddress.find(params[:id])
    
    respond_to do |format|
      if @user_target_address.update_attributes(params[:user_target_address])
        format.html { redirect_to admin_user_path(@user_target_address.user), :notice => @controller_name +t(:message_success_update) }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user_target_address.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @user_target_address = UserTargetAddress.find(params[:id])
    @user_target_address.destroy

    respond_to do |format|
      format.html { redirect_to admin_user_path(@user_target_address.user)}
      format.json { head :no_content }
    end
  end
end
