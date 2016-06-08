class Admin::AdsController < Admin::AdminController
  impressionist  
  load_and_authorize_resource  
  
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_ad)
    @controller_name=t('activerecord.models.ad')    
  end
  
  def ad_id_select
    @script='ads/ad_id_select'
  end
  
  def ad_id_select_search_result
    case params[:find_method]
      when 'title'
        condition_sql='title like ?'
      when 'description'
        condition_sql='description like ?'        
      when 'content'
        condition_sql='memos.content like ?'
    end
    
    unless params[:per_page].present?
      params[:per_page]=20
    end
    
    @ad_count = Ad.order('id desc').where(:ad_type_id=>params[:ad_type_id]).where(condition_sql,'%'+params[:search].strip+'%').count
    
    if(@ad_count.zero?)
      a={:count=>@ad_count}
    else
      if(params[:find_method]=='content')
        @ads = Ad.order('id desc').joins(:memo).where(:ad_type_id=>params[:ad_type_id]).where(condition_sql,'%'+params[:search].strip+'%').page(params[:page]).per(params[:per_page])
      else
        @ads = Ad.order('id desc').where(:ad_type_id=>params[:ad_type_id]).where(condition_sql,'%'+params[:search].strip+'%').page(params[:page]).per(params[:per_page])
      end
      
      @script='ads/ad_id_select'
      
      a={:count=>@ad_count,:list=>@ads}
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => a }
    end
  end    
  
  # GET /ads
  # GET /ads.json
  def index    
    unless params[:per_page].present?
      params[:per_page]=10        
    end
    
    if params[:format]=='xls'
      params[:page]=nil
      params[:per_page]=50000  
    end
        
    @ad_types = AdType.where(:flag=>true).all
    
    if params[:search_field].present? && params[:search_value].present?  
      if(params[:search_field]=='memo')
        likesql='ad_memos.content like ?'
        likep = '%'+params[:search_value].strip+'%'
      elsif(params[:search_field]=='description')
        likesql='ads.description like ?'
        likep = '%'+params[:search_value].strip+'%'
      elsif(params[:search_field]=='title')
        likesql='ads.title like ?'
        likep= '%'+params[:search_value].strip+'%'
      end
    end    
    
    conditions={}
    conditions[:ad_type_id]=params[:ad_type_id] if params[:ad_type_id].present?
    
    if(params[:search_field] && params[:search_value])
      if(params[:search_field]=='memo')
        if(likesql)
        @ads = Ad.joins(:ad_memo).where(likesql,likep).where(conditions).order('id desc').page(params[:page]).per(params[:per_page])
        else 
        @ads = Ad.joins(:ad_memo).where(likesql,likep).where(conditions).order('id desc').page(params[:page]).per(params[:per_page])
        end
      else
        @ads = Ad.where(conditions).where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])      
      end
    else
      @ads = Ad.order('id desc').page(params[:page]).per(params[:per_page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ads }
    end
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
    @ad = Ad.find(params[:id])
    @ad_schedules=@ad.ad_schedule.order('id asc')
    @ad_files=@ad.ad_file.order('id asc')
    
    
    @script='ads/show'    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ad }
    end
  end

  # GET /ads/new
  # GET /ads/new.json
  def new 
    @ad = Ad.new
    @ad.build_ad_state
    @ad.build_ad_option
    @ad.build_ad_memo    

    @script='ads/new'
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ad }
    end
  end

  # GET /ads/1/edit
  def edit      
    @ad = Ad.find(params[:id])
    @script='ads/new'
  end

  # POST /ads
  # POST /ads.json
  def create
    @ad = Ad.new(params[:ad])
    @ad.admin_id=current_admin.id
    
    @script='ads/new'        

    respond_to do |format|
      if @ad.save
        format.html { redirect_to admin_ad_path(@ad), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @ad, :status => :created, :location => @ad }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ads/1
  # PUT /ads/1.json
  def update
    @ad = Ad.find(params[:id])
    @script='ads/new'    

    respond_to do |format|
      if @ad.update_attributes(params[:ad])
        format.html { redirect_to admin_ad_path(@ad,{:page=>params[:page],:per_page=>params[:per_page]}), :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy

    respond_to do |format|
      format.html { redirect_to admin_ads_path }
      format.json { head :no_content }
    end
  end
end
