class Admin::AddressesController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_address)
    @controller_name=t('activerecord.models.address')
  end
  
  def address_id_select
    @script='addresses/address_id_select'
  end
  
  def address_id_select_search_result
    case params[:find_method]
      when 'name'
        condition_sql='name like ?'
      when 'full_name'
        condition_sql='email like ?'
      when 'address_id'
        condition_sql='id like ?'
    end
    
    unless params[:per_page].present?
      params[:per_page]=20
    end    
    
    @address_count = Address.order('id desc').where(condition_sql,'%'+params[:search].strip+'%').count    
    @addresses = Address.order('id desc').where(condition_sql,'%'+params[:search].strip+'%').page(params[:page]).per(params[:per_page])

    @script='addresses/address_id_select'
    
    if(@address_count.zero?)
      a={:count=>@address_count}
    else
      a={:count=>@address_count,:list=>@addresses}
    end 
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => a }
    end        
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
        likesql='id like ?'
        likep = '%'+params[:search_value].strip+'%'
      elsif(params[:search_field]=='address')
        likesql='name=?'
        likep= params[:search_value].strip
      end
    end
    
    if(params[:search_field].present? && params[:search_value].present?)
      if(params[:search_field]=='id')
        @addresses = Address.where(likesql,likep).page(params[:page]).per(params[:per_page])
      else
        @addresses = Address.where(likesql,likep).page(params[:page]).per(params[:per_page])      
      end
    else
      @addresses = Address.page(params[:page]).per(params[:per_page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @address }
    end
  end

  # GET /addresss/1
  # GET /addresss/1.json
  def show
    @address = Address.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @address }
    end
  end

  # GET /addresss/new
  # GET /addresss/new.json
  def new
    @address = Address.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @address }
    end
  end

  # GET /addresss/1/edit
  def edit
    @address = Address.find(params[:id])
    @address_list = Address.where("level >= 0").order('full_address asc')
  end

  # POST /addresss
  # POST /addresss.json
  def create
    @address = Address.new(params[:address])

    respond_to do |format|
      if @address.save
        format.html { redirect_to admin_address_path(@address), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @address, :status => :created, :location => @address }
      else
        format.html { render :action => "new" }
        format.json { render :json => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /addresss/1
  # PUT /addresss/1.json
  def update
    @address = Address.find(params[:id])

    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html { redirect_to admin_address_path(@address), :notice => @controller_name +t(:message_success_update)}
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
    @address = Address.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to admin_addresses_path }
      format.json { head :no_content }
    end
  end
end
