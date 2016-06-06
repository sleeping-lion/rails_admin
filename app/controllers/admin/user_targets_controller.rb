# encoding: utf-8

class Admin::UserTargetsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_user)
    @sub_menu=t(:submenu_user)
    @controller_name=t('activerecord.models.user_target')
  end
  
  def edit
    @user_target = UserTarget.find(params[:id])
    @user=@user_target.user
  end
  
  def create
    @user = User.find(params[:user_id])
    @users_targets = @user.user_target.create(params[:user_target])
    
    redirect_to admin_user_path(@user)
  end
  
  def update
    @user_target = UserTarget.find(params[:id])
    
    respond_to do |format|
      if @user_target.update_attributes(params[:user_target])
        format.html { redirect_to admin_user_path(@user_target.user), :notice => @controller_name +t(:message_success_update) }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user_target.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @user_target = UserTarget.find(params[:id])
    @user_target.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_path(@user_target.user)}
      format.json { head :no_content }
    end
  end
end
