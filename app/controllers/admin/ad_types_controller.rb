# encoding: utf-8

class Admin::AdTypesController < Admin::AdminController
  impressionist  
  load_and_authorize_resource 
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_ad_type)
    @controller_name=t('activerecord.models.ad_type')
  end
    
  # GET /AdTypes
  # GET /AdTypes.json
  def index
    @ad_types = AdType.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ad_types }
    end
  end

  # GET /AdTypes/1
  # GET /AdTypes/1.json
  def show
    @ad_type = AdType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ad_type }
    end
  end

  # GET /AdTypes/new
  # GET /AdTypes/new.json
  def new
    @ad_type = AdType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ad_type }
    end
  end

  # GET /AdTypes/1/edit
  def edit
    @ad_type = AdType.find(params[:id])
  end

  # POST /AdTypes
  # POST /AdTypes.json
  def create
    @ad_type = AdType.new(params[:ad_type])

    respond_to do |format|
      if @ad_type.save
        format.html { redirect_to @ad_type, :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @ad_type, :status => :created, :location => @ad_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ad_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /AdTypes/1
  # PUT /AdTypes/1.json
  def update
    @ad_type = AdType.find(params[:id])

    respond_to do |format|
      if @ad_type.update_attributes(params[:ad_type])
        format.html { redirect_to @ad_type, :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ad_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /AdTypes/1
  # DELETE /AdTypes/1.json
  def destroy
    @ad_type = AdType.find(params[:id])
    @ad_type.destroy

    respond_to do |format|
      format.html { redirect_to ad_types_url }
      format.json { head :no_content }
    end
  end
end
