# encoding: utf-8

class Admin::SponsorsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_sponsor) 
    @controller_name=t('activerecord.models.sponsor')
  end
  
  # GET /sponsors
  # GET /sponsors.json
  def index
    @sponsors = Sponsor.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @sponsors }
    end
  end

  # GET /sponsors/1
  # GET /sponsors/1.json
  def show
    @sponsor = Sponsor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @sponsor }
    end
  end

  # GET /sponsors/new
  # GET /sponsors/new.json
  def new
    @sponsor = Sponsor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @sponsor }
    end
  end

  # GET /sponsors/1/edit
  def edit
    @sponsor = Sponsor.find(params[:id])
  end

  # POST /sponsors
  # POST /sponsors.json
  def create
    @sponsor = Sponsor.new(params[:sponsor])

    respond_to do |format|
      if @sponsor.save
        format.html { redirect_to @sponsor, :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @sponsor, :status => :created, :location => @sponsor }
      else
        format.html { render :action => "new" }
        format.json { render :json => @sponsor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sponsors/1
  # PUT /sponsors/1.json
  def update
    @sponsor = Sponsor.find(params[:id])

    respond_to do |format|
      if @sponsor.update_attributes(params[:sponsor])
        format.html { redirect_to @sponsor, :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @sponsor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsors/1
  # DELETE /sponsors/1.json
  def destroy
    @sponsor = Sponsor.find(params[:id])
    @sponsor.destroy

    respond_to do |format|
      format.html { redirect_to sponsors_url }
      format.json { head :no_content }
    end
  end
end
