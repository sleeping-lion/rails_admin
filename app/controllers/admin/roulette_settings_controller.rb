# encoding: utf-8

class Admin::RouletteSettingsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_roulette_game) 
    @controller_name=t('activerecord.models.roulette_setting')
  end   
  
  # GET /game_setting
  # GET /game_setting.json
  def index
    @roulette_settings = RouletteSetting.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @roulette_settings }
    end
  end

  # GET /game_setting/1
  # GET /game_setting/1.json
  def show
    @roulette_setting = RouletteSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @roulette_setting }
    end
  end

  # GET /game_setting/new
  # GET /game_setting/new.json
  def new
    @roulette_setting = RouletteSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @roulette_setting }
    end
  end

  # GET /game_setting/1/edit
  def edit
    @roulette_setting = RouletteSetting.find(params[:id])
  end

  # POST /game_setting
  # POST /game_setting.json
  def create
    @roulette_setting = RouletteSetting.new(params[:roulette_setting])

    respond_to do |format|
      if @roulette_setting.save
        format.html { redirect_to @roulette_setting, :notice => @controller_name +t(:message_success_update) }
        format.json { render :json => @roulette_setting, :status => :created, :location => @roulette_setting }
      else
        format.html { render :action => "new" }
        format.json { render :json => @roulette_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /game_setting/1
  # PUT /game_setting/1.json
  def update
    @roulette_setting = RouletteSetting.find(params[:id])

    respond_to do |format|
      if @roulette_setting.update_attributes(params[:roulette_setting])
        format.html { redirect_to @roulette_setting, :notice => @controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @roulette_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /game_setting/1
  # DELETE /game_setting/1.json
  def destroy
    @roulette_setting = RouletteSetting.find(params[:id])
    @roulette_setting.destroy

    respond_to do |format|
      format.html { redirect_to roulette_settings_url }
      format.json { head :no_content }
    end
  end
end

