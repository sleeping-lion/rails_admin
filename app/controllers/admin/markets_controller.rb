class Admin::MarketsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_market)
    @controller_name=t('activerecord.models.market')
  end
  
  def market_id_select
    @script='market/market_id_select'
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
    
    @market_count = Market.order('id desc').where(condition_sql,'%'+params[:search].strip+'%').count    
    @markets = Market.order('id desc').where(condition_sql,'%'+params[:search].strip+'%').page(params[:page]).per(params[:per_page])

    @script='market/market_id_select'
    
    if(@market_count.zero?)
      a={:count=>@market_count}
    else
      a={:count=>@market_count,:list=>@markets}
    end 
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => a }
    end
  end  
  
  # GET /markets
  # GET /markets.json
  def index
    @markets = Market.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @markets }
    end
  end

  # GET /markets/1
  # GET /markets/1.json
  def show
    @market = Market.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @market }
    end
  end

  # GET /markets/new
  # GET /markets/new.json
  def new
    @market = Market.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @market }
    end
  end

  # GET /markets/1/edit
  def edit
    @market = Market.find(params[:id])
  end

  # POST /markets
  # POST /markets.json
  def create
    @market = Market.new(params[:market])

    respond_to do |format|
      if @market.save
        format.html { redirect_to admin_market_path(@market), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @market, :status => :created, :location => @market }
      else
        format.html { render :action => "new" }
        format.json { render :json => @market.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /markets/1
  # PUT /markets/1.json
  def update
    @market = Market.find(params[:id])

    respond_to do |format|
      if @market.update_attributes(params[:market])
        format.html { redirect_to admin_market_path(@market), :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @market.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /markets/1
  # DELETE /markets/1.json
  def destroy
    @market = Market.find(params[:id])
    @market.destroy

    respond_to do |format|
      format.html { redirect_to admin_markets_path }
      format.json { head :no_content }
    end
  end
end
