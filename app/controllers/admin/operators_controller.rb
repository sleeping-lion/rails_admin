class Admin::OperatorsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_user)
    @sub_menu=t(:submenu_operator)
    @controller_name=t('activerecord.models.operator')     
  end
 
  # GET /admins
  # GET /admins.json
  def index   
    @operators = Operator.where(:parent_id=>current_admin).order('id desc').page(params[:page]).per(10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @operators }
    end
  end
  
  def show
    @operator = Operator.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @operator }
    end
  end

  # GET /admins/new
  # GET /admins/new.json
  def new  
    @operator = Operator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @operator }
    end
  end

  # GET /users/1/edit
  def edit
    @operator = Operator.find(params[:id])  
  end

  # POST /users
  # POST /users.json
  def create
    @operator = Operator.new(params[:operator])
    @operator.transaction do 
      @or=@operator.save
      RolesAdmin.create(:role_id=>params[:role_id],:admin_id=>@operator.id)
    end

    respond_to do |format|
      if @or
        format.html { redirect_to operator_url(@operator), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @operator, :status => :created, :location => @operator }
      else
        format.html { render :action => "new" }
        format.json { render :json => @operator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @operator = Operator.find(params[:id])
    
    @operator.transaction do 
      @or=@operator.update_attributes(params[:operator])
      @operator.roles_admin[0].update_attributes(:role_id=>params[:role_id],:admin_id=>@operator.id)
    end    

    respond_to do |format|
      if @or
        format.html { redirect_to operator_url(@operator), :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @operator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @operator=Operator.find(params[:id])
    @operator.destroy   

    respond_to do |format|
      format.html { redirect_to operators_url }
      format.json { head :no_content }
    end
  end
end
