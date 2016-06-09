class Admin::QuizQuestionsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_quiz)
    @controller_name=t('activerecord.models.quiz_question')
    
    @script = 'quizzes/index'    
  end  
  
  # GET /quiz_questions
  # GET /quiz_questions.json
  def index
    @quiz = Quiz.find(params[:quiz_id])
    @quiz_questions = QuizQuestion.where(:quizzes_id=>params[:quiz_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quiz_questions }
    end
  end

  # GET /quiz_questions/1
  # GET /quiz_questions/1.json
  def show
    @quiz_question = QuizQuestion.find(params[:id])
    @quiz_answers=@quiz_question.quiz_answer.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quiz_question }
    end
  end

  # GET /quiz_questions/new
  # GET /quiz_questions/new.json
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @quiz_question = @quiz.quiz_question.new
    
    @script='after/new'
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quiz_question}
    end
  end

  # GET /quiz_questions/1/edit
  def edit
    @quiz = Quiz.find(params[:quiz_id])
    @quiz_question = QuizQuestion.find(params[:id])
  end

  # POST /quiz_questions
  # POST /quiz_questions.json
  def create
    @quiz = Quiz.find(params[:quiz_id])    
    @quiz_question = @quiz.quiz_question.create(params[:quiz_question])    
    redirect_to quiz_path(@quiz)
  end

  # PUT /quiz_questions/1
  # PUT /quiz_questions/1.json
  def update
    @quiz = Quiz.find(params[:quiz_id])
    @quiz_question = QuizQuestion.find(params[:id])

    respond_to do |format|
      if @quiz_question.update_attributes(params[:quiz_question])
        format.html { redirect_to admin_quiz_path(@quiz), :notice => @controller_name +t(:message_success_insert)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quiz_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_questions/1
  # DELETE /quiz_questions/1.json
  def destroy
    @quiz_question = QuizQuestion.find(params[:id])
    @quiz_question.destroy

    respond_to do |format|
      format.html { redirect_to admin_quiz_path(@quiz_question.quiz) }
      format.json { head :no_content }
    end
  end
end
