class Admin::QuizzesController < Admin::AdminController
  impressionist  
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_quiz)
    @controller_name=t('activerecord.models.quiz')
    
    @script = 'quizzes/index'
  end    
  
  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quizzes }
    end
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    @quiz = Quiz.find(params[:id])
    @quiz_questions = @quiz.quiz_question.all    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quiz }
    end
  end

  # GET /quizzes/new
  # GET /quizzes/new.json
  def new
    @quiz = Quiz.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quiz }
    end
  end

  # GET /quizzes/1/edit
  def edit
    @quiz = Quiz.find(params[:id])
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(params[:quiz])
    respond_to do |format|
      if @quiz.save
        #format.html { redirect_to new_quiz_question_path( :quiz_id => @quiz.id ), notice: 'Quiz was successfully created.' }
        format.html { redirect_to quiz_path( @quiz ), :notice => @controller_name +t(:message_success_insert)}
        #format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render json: @quiz, status: :created, location: @quiz }
      else
        format.html { render action: "new" }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quizzes/1
  # PUT /quizzes/1.json
  def update
    @quiz = Quiz.find(params[:id])

    respond_to do |format|
      if @quiz.update_attributes(params[:quiz])
        format.html { redirect_to @quiz, :notice => @controller_name +t(:message_success_insert)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy

    respond_to do |format|
      format.html { redirect_to quizzes_url }
      format.json { head :no_content }
    end
  end
end