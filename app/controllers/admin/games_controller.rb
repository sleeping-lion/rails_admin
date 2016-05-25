class Admin::GamesController < Admin::AdminController
  include Admin::SearchDate
  impressionist    
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_game)
    @sub_menu=t(:submenu_game)
    @controller_name=t('activerecord.models.game')
  end
  
  # GET /game
  # GET /game.json
  def index
    if params[:user_id].present?
      @game_all=Game.sum(:amount,:conditions=>{:user_id=>params[:user_id]})
      @game_get=Game.count(:conditions=>{:user_id=>params[:user_id]})*3
    else
      @game_all=Game.sum(:amount)
      @game_get=Game.count*3
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
      @games = Game.includes(:user).where(likesql,likep).where(conditions).where(:created_at => (change_date(params[:start_date],false))..(change_date(params[:end_date]))).order('games.id desc').page(params[:page]).per(params[:per_page])
    else 
      @games = Game.order('id desc').where(conditions).where(:created_at=>(change_date(params[:start_date],false))..(change_date(params[:end_date]))).page(params[:page]).per(params[:per_page])
    end
    
    
    @script='games/index'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @games }
    end
  end

  # GET /game/1
  # GET /game/1.json
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @game }
    end
  end

  # GET /game/new
  # GET /game/new.json
  def new
    @game = Game.new
    
    @script='games/new'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @game }
    end
  end

  # GET /game/1/edit
  def edit
    @game = Game.find(params[:id])
    
    @script='games/new'    
  end

  # POST /game
  # POST /game.json
  def create
    
    @point_type=PointType.find(5);
    use_amount=@point_type.amount
    @game = Game.new(params[:game])
    @user=User.find(@game.user_id)
    
    if @user.point<use_amount
      raise "포인트가 5개보다 적습니다."
    end
    
    unless params[:game][:game_setting_id].empty?
      @gameSetting = GameSetting.find(params[:game][:game_setting_id])
      if @gameSetting.amount?
        get_amount=@gameSetting.amount
      else
        get_amount=(1..100).sort_by{rand}[1]
      end
      game_setting_id=@gameSetting.id
    end
    

        
    @game.transaction do
      point=Point.create!(:user_id=>@user.id, :point_type_id=>5, :amount=>use_amount)       
      
      if(get_amount)
        point=Point.create!(:user_id=>@user.id, :point_type_id=>6, :amount=>get_amount)
        @game.amount=get_amount
      else
        @game.amount=use_amount
      end

      @game.point_id=point.id
      @game.game_setting_id=game_setting_id
      @s_save=@game.save!
      
      
      user_point=@user.point+@game.amount
      @user.update_attributes(:point=>user_point)
    end

    respond_to do |format|
      if @s_save
        format.html { redirect_to @game, :notice => @controller_name +t(:message_success_insert) }
        format.json { render :json => @game, :status => :created, :location => @game }
      else
        format.html { render :action => "new" }
        format.json { render :json => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /game/1
  # PUT /game/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /game/1
  # DELETE /game/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end
end
