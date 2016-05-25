class Admin::MessagesController < Admin::AdminController
  include Admin::SearchDate  
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_message)
    @controller_name=t('activerecord.models.message')
  end
  
  # GET /messages
  # GET /messages.json
  def index    
    unless params[:per_page].present?
      params[:per_page]=20
    end
    
    if params[:format]=='xls'
      params[:page]=nil
      parmas[:per_page]=50000
    end
    
    if params[:mobile_num].present? || params[:content].present?
      @messages = Message.where('1=1')

      if params[:mobile_num].present?
        @messages = @messages.where('msg_phone like ?',params[:mobile_num].strip+'%')
      end
      if params[:content].present?
        @messages = @messages.where('msg_text like ?','%'+params[:content].strip+'%')
      end
      if params[:start_date].present?
        @messages = @messages.where(:created_at => (change_date(params[:start_date],false))..(change_date(params[:end_date])))
      end
      @messages = @messages.order('id desc').page(params[:page]).per(params[:per_page])

    else
      @messages = Message.order('id desc').page(params[:page]).per(params[:per_page])
    end
    
    @script='messages/index'
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, :notice =>  @controller_name +t(:message_success_insert)}
        format.json { render :json => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, :notice =>  @controller_name +t(:message_success_insert)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end