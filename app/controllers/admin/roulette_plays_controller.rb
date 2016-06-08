class Admin::RoulettePlaysController < Admin::AdminController
  include Admin::SearchDate
  impressionist    
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_roulette_game) 
    @controller_name=t('activerecord.models.roulette_play')
  end
  
  # GET /game
  # GET /game.json
  def index
    if params[:user_id].present?
      @roulette_play_all=RoulettePlay.sum(:amount,:conditions=>{:user_id=>params[:user_id]})
      @roulette_play_get=RoulettePlay.count(:conditions=>{:user_id=>params[:user_id]})*3
    else
      @roulette_play_all=RoulettePlay.sum(:amount)
      @roulette_play_get=RoulettePlay.count*3
    end
    
    if params[:login_id].present? || params[:cell_phone].present?    
      likesql='1=1'
      likep=[]
    end
    
    if params[:login_id].present?
      likesql+=' AND users.username like ?'
      likep << '%'+params[:login_id].strip+'%'
    end
    
    if params[:cell_phone].present?
      likesql+=' AND users.mobile_num like ?'
      likep << '%'+params[:cell_phone].strip+'%'
    end
    
    unless params[:per_page].present?
      params[:per_page]=20        
    end
    
    if params[:format]=='xls'
      params[:page]=nil 
      params[:per_page]=50000
    end    
   
   
    conditions={}
    conditions[:user_id]=params[:user_id] if params[:user_id].present?
    conditions[:game_setting_id]=params[:game_setting_id] if params[:game_setting_id].present?
    
    
    if(likesql)
      @roulette_plays = RoulettePlay.includes(:user).where(likesql,likep).where(conditions).where(:created_at => (change_date(params[:start_date],false))..(change_date(params[:end_date]))).order('games.id desc').page(params[:page]).per(params[:per_page])
    else 
      @roulette_plays = RoulettePlay.order('id desc').where(conditions).where(:created_at=>(change_date(params[:start_date],false))..(change_date(params[:end_date]))).page(params[:page]).per(params[:per_page])
    end
    
    
    @script='roulettes/index'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @roulette_plays }
    end
  end

  # GET /game/1
  # GET /game/1.json
  def show
    @roulette_play = RoulettePlay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @roulette_play }
    end
  end

  # GET /game/new
  # GET /game/new.json
  def new
    @roulette_play = RoulettePlay.new
    
    @script='roulettes/new'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @roulette_play }
    end
  end

  # GET /game/1/edit
  def edit
    @roulette_play = RoulettePlay.find(params[:id])
    
    @script='roulettes/new'    
  end

  # POST /game
  # POST /game.json
  def create
    
    @point_type=PointType.find(5);
    use_amount=@point_type.amount
    @roulette_play = RoulettePlay.new(params[:roulette_play])
    @user=User.find(@roulette_play.user_id)
    
    if @user.point<use_amount
      raise "포인트가 5개보다 적습니다."
    end
    
    unless params[:roulette_play][:roulette_setting_id].empty?
      @roulette_setting = RouletteSetting.find(params[:roulette_play][:roulette_setting_id])
      if @roulette_setting.amount?
        get_amount=@roulette_setting.amount
      else
        get_amount=(1..100).sort_by{rand}[1]
      end
      game_setting_id=@roulette_setting.id
    end
    
    require "ipaddr"
        
    @roulette_play.transaction do
      point=Point.create!(:user_id=>@user.id, :point_type_id=>5, :amount=>use_amount)       
      
      if(get_amount)
        point=Point.create!(:user_id=>@user.id, :point_type_id=>6, :amount=>get_amount)
        @roulette_play.amount=get_amount
      else
        @roulette_play.amount=use_amount
      end

      @roulette_play.point_id=point.id
      @roulette_play.client_ip=IPAddr.new(request.env['REMOTE_ADDR']).to_i  
      @s_save=@roulette_play.save!
      
      
      user_point=@user.point+@roulette_play.amount
      @user.update_attributes(:point=>user_point)
    end

    respond_to do |format|
      if @s_save
        format.html { redirect_to admin_roulette_plays_path(@roulette_play), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @roulette_play, :status => :created, :location => @roulette_play }
      else
        format.html { render :action => "new" }
        format.json { render :json => @roulette_play.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /game/1
  # PUT /game/1.json
  def update
    @roulette_play = RoulettePlay.find(params[:id])

    respond_to do |format|
      if @roulette_play.update_attributes(params[:roulette_play])
        format.html { redirect_to admin_roulette_plays_path(@roulette_play), :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @roulette_play.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /game/1
  # DELETE /game/1.json
  def destroy
    @roulette_play = RoulettePlay.find(params[:id])
    @roulette_play.destroy

    respond_to do |format|
      format.html { redirect_to admin_roulette_plays_path }
      format.json { head :no_content }
    end
  end
end
