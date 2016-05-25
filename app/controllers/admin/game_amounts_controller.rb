class Admin::GameAmountsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_game)
    @sub_menu=t(:submenu_game_amount)    
    @controller_name=t('activerecord.models.game_amount')
  end   
  
  # GET /game
  # GET /game.json
  def index
    @game_amounts = GameAmount.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @game_amounts }
    end
  end

  # GET /game/1
  # GET /game/1.json
  def show
    @game_amount = GameAmount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @game_amount }
    end
  end

  # GET /game/new
  # GET /game/new.json
  def new
    @game_amount = GameAmount.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @game_amount }
    end
  end

  # GET /game/1/edit
  def edit
    @game_amount = GameAmount.find(params[:id])
  end

  # POST /game
  # POST /game.json
  def create
    @game_amount = GameAmount.new(params[:game_amount])

    respond_to do |format|
      if @game_amount.save
        format.html { redirect_to @game_amount, :notice => @controller_name +t(:message_success_update) }
        format.json { render :json => @game_amount, :status => :created, :location => @game_amount }
      else
        format.html { render :action => "new" }
        format.json { render :json => @game_amount.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /game/1
  # PUT /game/1.json
  def update
    @game_amount = GameAmount.find(params[:id])

    respond_to do |format|
      if @game_amount.update_attributes(params[:game_amount])
        format.html { redirect_to @game_amount, :notice => @controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @game_amount.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /game/1
  # DELETE /game/1.json
  def destroy
    @game_amount = GameAmount.find(params[:id])
    @game_amount.destroy

    respond_to do |format|
      format.html { redirect_to game_amounts_url }
      format.json { head :no_content }
    end
  end
end
