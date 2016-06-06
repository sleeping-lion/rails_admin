# encoding: utf-8

class Admin::RoulettePresentsController < Admin::AdminController
  impressionist
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_roulette_game) 
    @controller_name=t('activerecord.models.roulette_present')
  end
  
  def index
    unless params[:per_page].present?
      params[:per_page]=10        
    end
    
    @roulette_presents = RoulettePresent.order('id desc').page(params[:page]).per(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendances } 
    end
  end
  
  def edit
    @roulette_present = RoulettePresent.find(params[:id])
  end
  
  def show
    @roulette_present = RoulettePresent.find(params[:id])
  end  
  
  def create  
    @roulette_present = RoulettePresent.new(params[:roulette_present])

    respond_to do |format|
      if @roulette_present.save
        format.html { redirect_to admin_roulette_present_path(@roulette_present), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @roulette_present, :status => :created, :location => @roulette_present }
      else
        format.html { render :action => "new" }
        format.json { render :json => @roulette_present.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @roulette_present = RoulettePresent.find(params[:id])
    
    respond_to do |format|
      if @roulette_present.update_attributes(params[:roulette_present])
        format.html { redirect_to admin_roulette_present_path(@roulette_present), :notice => @controller_name +t(:message_success_insert)}
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @roulette_present.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @roulette_present = RoulettePresent.find(params[:id])
    @roulette_present.destroy

    respond_to do |format|
      format.html { redirect_to admin_roulette_presents_path }
      format.json { head :no_content }
    end
  end
end
