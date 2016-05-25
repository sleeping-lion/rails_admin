# encoding: utf-8

class Admin::RoulettePlayAddressesController < Admin::AdminController
  impressionist
  
  def initialize(*params)
    super(*params)
        
    @category=t(:menu_game)
    @sub_menu=t(:submenu_roulette_play_address)
    @controller_name=t('activerecord.models.roulette_play_address')
  end
  
  # GET /roulette_play_addresses
  # GET /roulette_play_addresses.json
  
  # 페이지 처리
  def index
    
    unless params[:per_page].present?
      params[:per_page]=20
    end

    unless params[:page].present?
      params[:page]=1
    end
    
    # 전체 리스트 count
    @roulette_play_address_count = RoulettePlayAddress.count()    
    @roulette_play_addresses = RoulettePlayAddress.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @roulette_play_addresses }
      format.xls      
    end
  end

  # GET /roulette_play_addresses/1
  # GET /roulette_play_addresses/1.json
  def show
    @roulette_play_address = RoulettePlayAddress.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @roulette_play_address }
    end
  end

  # GET /roulette_play_address/new
  # GET /roulette_play_addresses/new.json
  def new
    @roulette_play_address = RoulettePlayAddress.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @roulette_play_address }
    end
  end

  # GET /roulette_play_addresses/1/edit
  def edit
    @roulette_play_address = RoulettePlayAddress.find(params[:id])
  end
  
  # POST /roulette_play_addresses
  # POST /roulette_play_addresses.json
  def create
    @roulette_play_address = RoulettePlayAddress.new(params[:roulette_play_address])

    respond_to do |format|
      if @roulette_play_address.save
        format.html { redirect_to @roulette_play_address, :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @roulette_play_address, :status => :created, :location => @roulette_play_address }
      else
        format.html { render :action => "new" }
        format.json { render :json => @roulette_play_address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /roulette_play_addresses/1
  # PUT /roulette_play_addresses/1.json
  def update
    @roulette_play_address = RoulettePlayAddress.find(params[:id])

    respond_to do |format|
      if @roulette_play_address.update_attributes(params[ :roulette_play_address])
        format.html { redirect_to @roulette_play_address, :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @roulette_play_address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /roulette_play_addresses/1
  # DELETE /roulette_play_addresses/1.json
  def destroy
    @roulette_play_address = RoulettePlayAddress.find(params[:id])
    @roulette_play_address.destroy

    respond_to do |format|
      format.html { redirect_to roulette_play_addresses_url }
      format.json { head :no_content }
    end
  end
end
