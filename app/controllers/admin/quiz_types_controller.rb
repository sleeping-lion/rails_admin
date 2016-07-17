class Admin::QuizTypesController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_quiz_type)    
    @controller_name=t('activerecord.models.quiz_type')
  end  
  
  # GET /point_types
  # GET /point_types.json
  def index
    unless params[:per_page].present?
      params[:per_page]=10        
    end
    
    @quiz_types = QuizType.order('id desc').page(params[:page]).per(params[:per_page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @quiz_types }
    end
  end

  # GET /point_types/1
  # GET /point_types/1.json
  def show
    @quiz_type = QuizType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @quiz_type }
    end
  end

  # GET /point_types/new
  # GET /point_types/new.json
  def new
    @quiz_type = QuizType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @quiz_type }
    end
  end

  # GET /point_types/1/edit
  def edit
    @quiz_type = QuizType.find(params[:id])
  end

  # POST /point_types
  # POST /point_types.json
  def create
    @quiz_type = QuizType.new(params[:quiz_type])

    respond_to do |format|
      if @quiz_type.save
        format.html { redirect_to admin_quiz_type_path(@quiz_type), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @quiz_type, :status => :created, :location => @quiz_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @quiz_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /point_types/1
  # PUT /point_types/1.json
  def update
    @quiz_type = QuizType.find(params[:id])

    respond_to do |format|
      if @quiz_type.update_attributes(params[:quiz_type])
        format.html { redirect_to admin_quiz_type_path(@quiz_type), :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @quiz_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /point_types/1
  # DELETE /point_types/1.json
  def destroy
    @quiz_type = QuizType.find(params[:id])
    @quiz_type.destroy

    respond_to do |format|
      format.html { redirect_to admin_quiz_types_path }
      format.json { head :no_content }
    end
  end
end
