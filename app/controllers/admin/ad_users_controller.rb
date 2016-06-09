class Admin::AdUsersController < Admin::AdminController
  # GET /ad_users
  # GET /ad_users.json
  def index
    @ad_users = AdUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ad_users }
    end
  end

  # GET /ad_users/1
  # GET /ad_users/1.json
  def show
    @ad_user = AdUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ad_user }
    end
  end

  # GET /ad_users/new
  # GET /ad_users/new.json
  def new
    @ad_user = AdUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ad_user }
    end
  end

  # GET /ad_users/1/edit
  def edit
    @ad_user = AdUser.find(params[:id])
  end

  # POST /ad_users
  # POST /ad_users.json
  def create
    @ad_user = AdUser.new(params[:ad_user])

    respond_to do |format|
      if @ad_user.save
        format.html { redirect_to admin_ad_user_path(@ad_user), :notice =>  @controller_name +t(:message_success_insert)}
        format.json { render json: @ad_user, status: :created, location: @ad_user }
      else
        format.html { render action: "new" }
        format.json { render json: @ad_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ad_users/1
  # PUT /ad_users/1.json
  def update
    @ad_user = AdUser.find(params[:id])

    respond_to do |format|
      if @ad_user.update_attributes(params[:ad_user])
        format.html { redirect_to admin_ad_user_path(@ad_user), :notice =>  @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ad_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_users/1
  # DELETE /ad_users/1.json
  def destroy
    @ad_user = AdUser.find(params[:id])
    @ad_user.destroy

    respond_to do |format|
      format.html { redirect_to admin_ad_users_path }
      format.json { head :no_content }
    end
  end
end
