# encoding: utf-8

class Admin::StoreGoodsController < Admin::AdminController
  include Admin::SearchDate
  impressionist
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_store)
    @sub_menu=t(:submenu_product)
    @controller_name=t('activerecord.models.store_good')
  end 
  
  # GET /store_goods
  # GET /store_goods.json
  def index    
    unless params[:per_page].present?
      params[:per_page]=10
    end
    
    if params[:format]=='xls'
      params[:page]=nil
      per_page=50000  
    end
    
    if params[:title].present?
      likesql='title like ?'
      likep='%'+params[:title]+'%'
    end
   
    conditions={}
    conditions[:user_id]=params[:user_id] if params[:user_id].present?
    
    if(likesql)
      @store_goods = StoreGood.where(likesql,likep).where(:created_at => (change_date(params[:start_date],false))..(change_date(params[:end_date]))).order('id desc').page(params[:page]).per(per_page)
    else
      @store_goods = StoreGood.order('id desc').where(:created_at=>(change_date(params[:start_date],false))..(change_date(params[:end_date]))).page(params[:page]).per(per_page)
    end
    
    @script='store_goods/index'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @store_goods }
    end
  end

  # GET /store_goods/1
  # GET /store_goods/1.json
  def show
    @store_good = StoreGood.find(params[:id])
    @store_good_pictures=@store_good.store_good_picture

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @store_good }
    end
  end

  # GET /store_goods/new
  # GET /store_goods/new.json
  def new
    @store_good = StoreGood.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @store_good }
    end
  end

  # GET /store_goods/1/edit
  def edit
    @store_good = StoreGood.find(params[:id])
  end

  # POST /store_goods
  # POST /store_goods.json
  def create
    @store_good = StoreGood.new(params[:store_good])

    respond_to do |format|
      if @store_good.save
        format.html { redirect_to admin_store_good_path(@store_good), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @store_good, :status => :created, :location => @store_good }
      else
        format.html { render :action => "new" }
        format.json { render :json => @store_good.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /store_goods/1
  # PUT /store_goods/1.json
  def update
    @store_good = StoreGood.find(params[:id])

    respond_to do |format|
      if @store_good.update_attributes(params[:store_good])
        format.html { redirect_to admin_store_good_path(@store_good), :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @store_good.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /store_goods/1
  # DELETE /store_goods/1.json
  def destroy
    @store_good = StoreGood.find(params[:id])
    @store_good.destroy

    respond_to do |format|
      format.html { redirect_to admin_store_goods_path }
      format.json { head :no_content }
    end
  end
end
