class Admin::QuizLogsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
            
    @category=t(:menu_quiz)
    @sub_menu=t(:submenu_quiz_log)
    @controller_name=t('activerecord.models.quiz_log')
    
    @script = 'quizzes/index'    
  end  
  
  # GET /quiz_logs
  # GET /quiz_logs.json
  def index
    @quiz_logs = QuizLog.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quiz_logs }
    end
  end

  # GET /quiz_logs/1
  # GET /quiz_logs/1.json
  def show
    @quiz_log = QuizLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quiz_log }
    end
  end

  # GET /quiz_logs/new
  # GET /quiz_logs/new.json
  def new
    @quiz_log = QuizLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quiz_log }
    end
  end

  # GET /quiz_logs/1/edit
  def edit
    @quiz_log = QuizLog.find(params[:id])
  end

  # POST /quiz_logs
  # POST /quiz_logs.json
  def create
    @quiz_log = QuizLog.new(params[:quiz_log])

    respond_to do |format|
      if @quiz_log.save
        format.html { redirect_to admin_quiz_log_path(@quiz_log), :notice => @controller_name +t(:message_success_update)}
        format.json { render json: @quiz_log, status: :created, location: @quiz_log }
      else
        format.html { render action: "new" }
        format.json { render json: @quiz_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quiz_logs/1
  # PUT /quiz_logs/1.json
  def update
    @quiz_log = QuizLog.find(params[:id])

    respond_to do |format|
      if @quiz_log.update_attributes(params[:quiz_log])
        format.html { redirect_to admin_quiz_log_path(@quiz_log), :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quiz_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_logs/1
  # DELETE /quiz_logs/1.json
  def destroy
    @quiz_log = QuizLog.find(params[:id])
    @quiz_log.destroy

    respond_to do |format|
      format.html { redirect_to admin_quiz_logs_path }
      format.json { head :no_content }
    end
  end
end
