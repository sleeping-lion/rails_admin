# encoding: utf-8

class Admin::BanksController < Admin::AdminController
  impressionist  
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_bank)
    @controller_name=t('activerecord.models.bank')
  end  
  
  # GET /bank
  # GET /bank.json
  def index
    @banks = Bank.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @banks }
    end
  end

  # GET /bank/1
  # GET /bank/1.json
  def show
    @bank = Bank.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @bank }
    end
  end

  # GET /bank/new
  # GET /bank/new.json
  def new
    @bank = Bank.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @bank }
    end
  end

  # GET /bank/1/edit
  def edit
    @bank = Bank.find(params[:id])
  end

  # POST /bank
  # POST /bank.json
  def create
    @bank = Bank.new(params[:bank])

    respond_to do |format|
      if @bank.save
        format.html { redirect_to @bank, :notice => @controller_name +t(:message_success_insert)  }
        format.json { render :json => @bank, :status => :created, :location => @bank }
      else
        format.html { render :action => "new" }
        format.json { render :json => @bank.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bank/1
  # PUT /bank/1.json
  def update
    @bank = Bank.find(params[:id])

    respond_to do |format|
      if @bank.update_attributes(params[:bank])
        format.html { redirect_to @bank, :notice =>@controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @bank.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bank/1
  # DELETE /bank/1.json
  def destroy
    @bank = Bank.find(params[:id])
    @bank.destroy

    respond_to do |format|
      format.html { redirect_to banks_url }
      format.json { head :no_content }
    end
  end
end
