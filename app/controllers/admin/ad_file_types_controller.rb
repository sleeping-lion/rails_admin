class Admin::AdFileTypesController < Admin::AdminController
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_basic)
    @sub_menu=t(:submenu_ad_file_type)
    @controller_name=t('activerecord.models.ad_file_type')
  end
    
  # GET /AdFileTypes
  # GET /AdFileTypes.json
  def index
    @ad_file_types = AdFileType.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ad_file_types }
    end
  end

  # GET /AdFileTypes/1
  # GET /AdFileTypes/1.json
  def show
    @ad_file_type = AdFileType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ad_file_type }
    end
  end

  # GET /AdFileTypes/new
  # GET /AdFileTypes/new.json
  def new
    @ad_file_type = AdFileType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ad_file_type }
    end
  end

  # GET /AdFileTypes/1/edit
  def edit
    @ad_file_type = AdFileType.find(params[:id])
  end

  # POST /AdFileTypes
  # POST /AdFileTypes.json
  def create
    @ad_file_type = AdFileType.new(params[:ad_file_type])

    respond_to do |format|
      if @ad_file_type.save
        format.html { redirect_to admin_ad_file_type_path(@ad_file_type), :notice => @controller_name +t(:message_success_insert) }
        format.json { render :json => @ad_file_type, :status => :created, :location => @ad_file_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ad_file_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /AdFileTypes/1
  # PUT /AdFileTypes/1.json
  def update
    @ad_file_type = AdFileType.find(params[:id])

    respond_to do |format|
      if @ad_file_type.update_attributes(params[:ad_file_type])
        format.html { redirect_to admin_ad_file_type_path(@ad_file_type), :notice => @controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ad_file_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /AdFileTypes/1
  # DELETE /AdFileTypes/1.json
  def destroy
    @ad_file_type = AdFileType.find(params[:id])
    @ad_file_type.destroy

    respond_to do |format|
      format.html { redirect_to admin_ad_file_types_path }
      format.json { head :no_content }
    end
  end
end
