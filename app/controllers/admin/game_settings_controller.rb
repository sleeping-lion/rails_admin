class Admin::GameSettingsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_game)
    @sub_menu=t(:submenu_game_setting)    
    @controller_name=t('activerecord.models.game_setting')
  end   
  
  # GET /game
  # GET /game.json
  def index
    @game_settings = GameSetting.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @game_settings }
    end
  end

  # GET /game/1
  # GET /game/1.json
  def show
    @game_setting = GameSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @game_setting }
    end
  end

  # GET /game/new
  # GET /game/new.json
  def new
    @game_setting = GameSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @game_setting }
    end
  end

  # GET /game/1/edit
  def edit
    @game_setting = GameSetting.find(params[:id])
  end

  # POST /game
  # POST /game.json
  def create
    @game_setting = GameSetting.new(params[:game_setting])

    respond_to do |format|
      if @game_setting.save
        format.html { redirect_to @game_setting, :notice => @controller_name +t(:message_success_update) }
        format.json { render :json => @game_setting, :status => :created, :location => @game_setting }
      else
        format.html { render :action => "new" }
        format.json { render :json => @game_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /game/1
  # PUT /game/1.json
  def update
    @game_setting = GameSetting.find(params[:id])

    respond_to do |format|
      if @game_setting.update_attributes(params[:game_setting])
        format.html { redirect_to @game_setting, :notice => @controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @game_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /game/1
  # DELETE /game/1.json
  def destroy
    @game_setting = GameSetting.find(params[:id])
    @game_setting.destroy

    respond_to do |format|
      format.html { redirect_to game_settings_url }
      format.json { head :no_content }
    end
  end
end
