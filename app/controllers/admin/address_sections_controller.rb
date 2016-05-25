# encoding: utf-8

class Admin::AddressSectionsController < Admin::AdminController
  impressionist
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_address_section)
    @controller_name=t('activerecord.models.address_section')
  end  
  
  # GET /addresss
  # GET /addresss.json
  def index
    unless params[:per_page].present?
      params[:per_page]=20
    end
    
    if params[:format]=='xls'
      params[:page]=nil
      params[:per_page]=50000  
    end
    
    if params[:search_field].present? && params[:search_value].present?   
      if(params[:search_field]=='id')
        likesql='address_id like ?'
        likep = params[:search_value].strip
      elsif(params[:search_field]=='address')
        likesql='full_address like ?'
        likep= '%'+params[:search_value].strip+'%'
      elsif(params[:search_field]=='section')
        likesql='section like ?'
        likep= params[:search_value].strip+'%'
      end
    end
    
    if(params[:search_field].present? && params[:search_value].present?)
      if(params[:search_field]=='id')
        @address_sections = AddressSection.select('address_sections.*,addresses.full_address').joins(:address).where(likesql,likep).order('address_sections.id desc').page(params[:page]).per(params[:per_page])
      else
        @address_sections = AddressSection.select('address_sections.*,addresses.full_address').joins(:address).where(likesql,likep).order('address_sections.id desc').page(params[:page]).per(params[:per_page])      
      end
    else
      @address_sections = AddressSection.select('address_sections.*,addresses.full_address').joins(:address).order('address_sections.id desc').page(params[:page]).per(params[:per_page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @address_sections }
      format.xls      
    end
  end

  # GET /addresss/1
  # GET /addresss/1.json
  def show
    @address_section = AddressSection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @address }
    end
  end

  # GET /addresss/new
  # GET /addresss/new.json
  def new
    @address_section = AddressSection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @address }
    end
  end

  # GET /addresss/1/edit
  def edit
    @address_section = AddressSection.find(params[:id])
  end

  # POST /addresss
  # POST /addresss.json
  def create
    @address_section = AddressSection.new(params[:address_section])

    respond_to do |format|
      if @address_section.save
        format.html { redirect_to @address_section, :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @address_section, :status => :created, :location => @address }
      else
        format.html { render :action => "new" }
        format.json { render :json => @address_section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /addresss/1
  # PUT /addresss/1.json
  def update
    @address_section = AddressSection.find(params[:id])

    respond_to do |format|
      if @address_section.update_attributes(params[:address_section])
        format.html { redirect_to @address_section, :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /addresss/1
  # DELETE /addresss/1.json
  def destroy
    @address_section = AddressSection.find(params[:id])
    @address_section.destroy

    respond_to do |format|
      format.html { redirect_to address_sections_url }
      format.json { head :no_content }
    end
  end
end