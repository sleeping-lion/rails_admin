class Admin::UserReferralsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category='회원관리'
    @controller_name='회원목표'
  end
  
  def edit
    @user_referral = UserReferral.find(params[:id])
    @user=@user_referral.user
  end
  
  def create
    @user = User.find(params[:user_id])
    @user.build_user_referral(params[:user_referral])
    @user.save
    
    redirect_to admin_user_path(@user)
  end
  
  def update
    @user_referral = UserReferral.find(params[:id])
    
    respond_to do |format|
      if @user_referral.update_attributes(params[:user_referral])
        format.html { redirect_to admin_user_path(@user_referral.user), :notice =>  @controller_name +t(:message_success_update) }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user_referral.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @user_referral = UserReferral.find(params[:id])
    @user_referral.destroy

    respond_to do |format|
      format.html { redirect_to admin_user_path(@user_referral.user)}
      format.json { head :no_content }
    end
  end
end
