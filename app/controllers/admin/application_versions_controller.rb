# encoding: utf-8

class Admin::ApplicationVersionsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_version)
    @controller_name=t('activerecord.models.application_version')
  end
  
  # GET /bank
  # GET /bank.json
  def index
    @application_versions = ApplicationVersion.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @application_versions }
    end
  end

  # GET /bank/1
  # GET /bank/1.json
  def show
    @application_version = ApplicationVersion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @application_version }
    end
  end

  # GET /bank/new
  # GET /bank/new.json
  def new
  
    @application_version = ApplicationVersion.new
    @script='boards/new'  
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @application_version }
    end
  end

  # GET /bank/1/edit
  def edit
    @application_version = ApplicationVersion.find(params[:id])
  end

  # POST /bank
  # POST /bank.json
  def create
    @application_version = ApplicationVersion.new(params[:application_version])

    respond_to do |format|
      if @application_version.save
        format.html { redirect_to admin_application_version_path(@application_version), :notice => @controller_name +t(:message_success_insert)  }
        format.json { render :json => @application_version, :status => :created, :location => @application }
      else
        format.html { render :action => "new" }
        format.json { render :json => @application_version.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bank/1
  # PUT /bank/1.json
  def update
    @application_version = ApplicationVersion.find(params[:id])

    respond_to do |format|
      if @application_version.update_attributes(params[:application_version])
        format.html { redirect_to admin_application_version_path(@application_version), :notice => @controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @application_version.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bank/1
  # DELETE /bank/1.json
  def destroy
    @application_version = ApplicationVersion.find(params[:id])
    @application_version.destroy

    respond_to do |format|
      format.html { redirect_to admin_application_versions_path }
      format.json { head :no_content }
    end
  end
end
