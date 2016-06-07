# encoding: utf-8

class Admin::TargetTypesController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_target_type)
    @controller_name=t('activerecord.models.target_type')
  end
  
  # GET /target_types
  # GET /target_types.json
  def index
    @target_types = TargetType.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @target_types }
    end
  end

  # GET /target_types/1
  # GET /target_types/1.json
  def show
    @target_type = TargetType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @target_type }
    end
  end

  # GET /target_types/new
  # GET /target_types/new.json
  def new
    @target_type = TargetType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @target_type }
    end
  end

  # GET /target_types/1/edit
  def edit
    @target_type = TargetType.find(params[:id])
  end

  # POST /target_types
  # POST /target_types.json
  def create
    @target_type = TargetType.new(params[:target_type])

    respond_to do |format|
      if @target_type.save
        format.html { redirect_to admin_target_type_path(@target_type), :notice => @controller_name+t(:message_success_insert)}
        format.json { render :json => @target_type, :status => :created, :location => @target_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @target_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /target_types/1
  # PUT /target_types/1.json
  def update
    @target_type = TargetType.find(params[:id])

    respond_to do |format|
      if @target_type.update_attributes(params[:target_type])
        format.html { redirect_to admin_target_type_path(@target_type), :notice => @controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @target_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /target_types/1
  # DELETE /target_types/1.json
  def destroy
    @target_type = TargetType.find(params[:id])
    @target_type.destroy

    respond_to do |format|
      format.html { redirect_to admin_target_types_path }
      format.json { head :no_content }
    end
  end
end
