class Admin::QuizAddressesController < Admin::AdminController
  impressionist
  
  def initialize(*params)
    super(*params)
        
    @category=t(:menu_quiz)
    @sub_menu=t(:submenu_quiz_addresses)
    @controller_name=t('activerecord.models.quiz_address')
  end
  
  
  # GET /quiz_addresses
  # GET /quiz_addresses.json
  def index
    
    unless params[:per_page].present?
      params[:per_page]=20
    end

    unless params[:page].present?
      params[:page]=1
    end
    
    
    # 전체 리스트 count
    @quiz_address_count = QuizAddress.count()    
    @quiz_addresses = QuizAddress.order('id desc').page(params[:page]).per(10)
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @quiz_addresses }
    end
  end

  # GET /quiz_addresses/1
  # GET /quiz_addresses/1.json
  def show
    @quiz_address = QuizAddress.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @quiz_address }
    end
  end

  # GET /quiz_addresses/new
  # GET /quiz_addresses/new.json
  def new
    @quiz_address = QuizAddress.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @quiz_address }
    end
  end

  # GET /quiz_addresses/1/edit
  def edit
    @quiz_address = QuizAddress.find(params[:id])
  end

  # POST /quiz_addresses
  # POST /quiz_addresses.json
  def create
    @quiz_address = QuizAddress.new(params[:quiz_address])

    respond_to do |format|
      if @quiz_address.save
        format.html { redirect_to @quiz_address, :notice => @controller_name +t(:message_success_insert)}
        format.json { render json: @quiz_address, :status => :created, :location => @quiz_address }
      else
        format.html { render :action => "new" }
        format.json { render :json => @quiz_address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quiz_addresses/1
  # PUT /quiz_addresses/1.json
  def update
    @quiz_address = QuizAddress.find(params[:id])

    respond_to do |format|
      if @quiz_address.update_attributes(params[:quiz_address])
        format.html { redirect_to @quiz_address, :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quiz_address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_addresses/1
  # DELETE /quiz_addresses/1.json
  def destroy
    @quiz_address = QuizAddress.find(params[:id])
    @quiz_address.destroy

    respond_to do |format|
      format.html { redirect_to quiz_addresses_url }
      format.json { head :no_content }
    end
  end
end
