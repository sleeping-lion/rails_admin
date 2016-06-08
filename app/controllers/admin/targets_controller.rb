class Admin::TargetsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_target)
    @controller_name=t('activerecord.models.target')
  end 
  
  # GET /targets
  # GET /targets.json
  def index
    @targets = Target.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @targets }
    end
  end

  # GET /targets/1
  # GET /targets/1.json
  def show
    @target = Target.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @target }
    end
  end

  # GET /targets/new
  # GET /targets/new.json
  def new
    @target = Target.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @target }
    end
  end

  # GET /targets/1/edit
  def edit
    @target = Target.find(params[:id])
  end

  # POST /targets
  # POST /targets.json
  def create
    @target = Target.new(params[:target])

    respond_to do |format|
      if @target.save
        format.html { redirect_to admin_target_path(@target), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @target, :status => :created, :location => @target }
      else
        format.html { render :action => "new" }
        format.json { render :json => @target.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /targets/1
  # PUT /targets/1.json
  def update
    @target = Target.find(params[:id])

    respond_to do |format|
      if @target.update_attributes(params[:target])
        format.html { redirect_to admin_target_path(@target), :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @target.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /targets/1
  # DELETE /targets/1.json
  def destroy
    @target = Target.find(params[:id])
    @target.destroy

    respond_to do |format|
      format.html { redirect_to admin_targets_path }
      format.json { head :no_content }
    end
  end
end
