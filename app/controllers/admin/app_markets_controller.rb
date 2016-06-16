class Admin::AppMarketsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_app_market)
    @controller_name=t('activerecord.models.app_market')
  end
  
  def market_id_select
    @script='app_market/market_id_select'
  end
  
  def market_id_select_search_result
    case params[:find_method]
      when 'title'
        condition_sql='title like ?'
      when 'id'
        condition_sql='id like ?'
    end
    
    unless params[:per_page].present?
      params[:per_page]=20
    end    
    
    @app_market_count = AppMarket.order('id desc').where(condition_sql,'%'+params[:search].strip+'%').count    
    @app_markets = AppMarket.order('id desc').where(condition_sql,'%'+params[:search].strip+'%').page(params[:page]).per(params[:per_page])

    @script='app_market/market_id_select'
    
    if(@app_market_count.zero?)
      a={:count=>@app_market_count}
    else
      a={:count=>@app_market_count,:list=>@app_markets}
    end 
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => a }
    end
  end  
  
  # GET /markets
  # GET /markets.json
  def index
    @app_markets = AppMarket.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @app_markets }
    end
  end

  # GET /markets/1
  # GET /markets/1.json
  def show
    @app_market = AppMarket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @app_market }
    end
  end

  # GET /markets/new
  # GET /markets/new.json
  def new
    @app_market = AppMarket.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @app_market }
    end
  end

  # GET /markets/1/edit
  def edit
    @app_market = AppMarket.find(params[:id])
  end

  # POST /markets
  # POST /markets.json
  def create
    @app_market = AppMarket.new(params[:app_market])

    respond_to do |format|
      if @app_market.save
        format.html { redirect_to admin_app_market_path(@app_market), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @app_market, :status => :created, :location => @app_market }
      else
        format.html { render :action => "new" }
        format.json { render :json => @app_market.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /markets/1
  # PUT /markets/1.json
  def update
    @app_market = AppMarket.find(params[:id])

    respond_to do |format|
      if @app_market.update_attributes(params[:app_market])
        format.html { redirect_to admin_app_market_path(@app_market), :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @app_market.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /markets/1
  # DELETE /markets/1.json
  def destroy
    @app_market = AppMarket.find(params[:id])
    @app_market.destroy

    respond_to do |format|
      format.html { redirect_to admin_app_markets_path }
      format.json { head :no_content }
    end
  end
end
