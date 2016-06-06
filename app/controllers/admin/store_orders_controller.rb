# encoding: utf-8

class Admin::StoreOrdersController < Admin::AdminController
  include Admin::SearchDate
  impressionist
  load_and_authorize_resource 
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_store)
    @sub_menu=t(:submenu_order)
    @controller_name=t('activerecord.models.store_order')
  end  
  
  # GET /store_orders
  # GET /store_orders.json
  def index
    unless params[:per_page].present?
      params[:per_page]=20
    end
    
    if params[:format]=='xls'
      params[:page]=nil
      per_page=50000  
    end
   
    if params[:search_field].present? && params[:search_value].present?  
      if(params[:search_field]=='user_id')
        likesql='user_id like ?'
        likep = '%'+params[:search_value].strip+'%'
      elsif(params[:search_field]=='mobile_num')
        likesql='customer_tel like ?'
        likep = '%'+params[:search_value].strip+'%'
      end
    end
    
    if(likesql)
      @store_orders = StoreOrder.where(likesql,likep).where(:created_at => (change_date(params[:start_date],false))..(change_date(params[:end_date]))).order('id desc').page(params[:page]).per(params[:per_page])
    else
      @store_orders = StoreOrder.order('id desc').where(:created_at=>(change_date(params[:start_date],false))..(change_date(params[:end_date]))).page(params[:page]).per(params[:per_page])
    end
    
    @script='store_orders/index'    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @store_orders }
    end
  end

  # GET /store_orders/1
  # GET /store_orders/1.json
  def show
    @store_order = StoreOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @store_order }
    end
  end

  # GET /store_orders/new
  # GET /store_orders/new.json
  def new
    @store_order = StoreOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @store_order }
    end
  end

  # GET /store_orders/1/edit
  def edit
    @store_order = StoreOrder.find(params[:id])
  end

  # POST /store_orders
  # POST /store_orders.json
  def create
    @store_order = StoreOrder.new(params[:store_order])

    respond_to do |format|
      if @store_order.save
        format.html { redirect_to admin_store_order_path(@store_order), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @store_order, :status => :created, :location => @store_order }
      else
        format.html { render :action => "new" }
        format.json { render :json => @store_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /store_orders/1
  # PUT /store_orders/1.json
  def update
    @store_order = StoreOrder.find(params[:id])

    respond_to do |format|
      if @store_order.update_attributes(params[:store_order])
        format.html { redirect_to admin_store_order_path(@store_order), :notice => @controller_name +t(:message_success_insert)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @store_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /store_orders/1
  # DELETE /store_orders/1.json
  def destroy
    @store_order = StoreOrder.find(params[:id])
    @store_order.destroy

    respond_to do |format|
      format.html { redirect_to admin_store_orders_path }
      format.json { head :no_content }
    end
  end
end
