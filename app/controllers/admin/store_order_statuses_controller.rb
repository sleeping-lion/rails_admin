class Admin::StoreOrderStatusesController < Admin::AdminController
  impressionist
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_store_order_status)
    @controller_name=t('activerecord.models.store_order_status')
  end 
  
  # GET /store_order_statuses
  # GET /store_order_statuses.json
  def index
    unless params[:per_page].present?
      params[:per_page]=10        
    end 
    
    @store_order_statuses = StoreOrderStatus.order('id desc').page(params[:page]).per(params[:per_page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @store_order_statuses }
    end
  end

  # GET /store_order_statuses/1
  # GET /store_order_statuses/1.json
  def show
    @store_order_status = StoreOrderStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @store_order_status }
    end
  end

  # GET /store_order_statuses/new
  # GET /store_order_statuses/new.json
  def new
    @store_order_status = StoreOrderStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @store_order_status }
    end
  end

  # GET /store_order_statuses/1/edit
  def edit
    @store_order_status = StoreOrderStatus.find(params[:id])
  end

  # POST /store_order_statuses
  # POST /store_order_statuses.json
  def create
    @store_order_status = StoreOrderStatus.new(params[:store_order_status])

    respond_to do |format|
      if @store_order_status.save
        format.html { redirect_to admin_store_order_status_path(@store_order_status), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @store_order_status, :status => :created, :location => @store_order_status }
      else
        format.html { render :action => "new" }
        format.json { render :json => @store_order_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /store_order_statuses/1
  # PUT /store_order_statuses/1.json
  def update
    @store_order_status = StoreOrderStatus.find(params[:id])

    respond_to do |format|
      if @store_order_status.update_attributes(params[:store_order_status])
        format.html { redirect_to admin_store_order_status_path(@store_order_status), :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @store_order_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /store_order_statuses/1
  # DELETE /store_order_statuses/1.json
  def destroy
    @store_order_status = StoreOrderStatus.find(params[:id])
    @store_order_status.destroy

    respond_to do |format|
      format.html { redirect_to admin_store_order_statuses_path }
      format.json { head :no_content }
    end
  end
end
