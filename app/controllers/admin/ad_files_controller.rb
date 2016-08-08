class Admin::AdFilesController < Admin::AdminController
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_ad)
    @controller_name=t('activerecord.models.ad_file')    
  end  
  
  def publish
    @ad = Ad.find(params[:ad_id])
    
    dir_path="#{Rails.root}/public/uploads/ad_file/photo/#{@ad.id}/";
    dest_path="/home/mynm/dev/mynm3api/mynm_data/"
    
    require 'fileutils' 
    
    tn=Time.now.to_date

    # Call 광고 처리
    if @ad.ad_type_id == 2
      Zip::Archive.open(dest_path+"/ad_img/#{@ad.ad_type.file_prefix}/#{@ad.ad_type.file_prefix}_#{@ad.id.to_s.rjust(6,'0')}.zip", Zip::CREATE | Zip::TRUNC) do |ar|
        a=0
        @ad.ad_file.find_each(:conditions=>'ad_file_type_id = 2') do |af|
          filename = af.photo.to_s

          Dir.glob(dir_path+af.id.to_s+'/client_480*.*') do |f|
            filename = File.basename(f, File.extname(f))
            FileUtils.cp(f,dir_path + "#{@ad.ad_type.file_prefix}_#{@ad.id.to_s.rjust(6,'0')}_#{a.to_s.rjust(2,'0')}" + File.extname(f))
            ar.add_file(dir_path + "#{@ad.ad_type.file_prefix}_#{@ad.id.to_s.rjust(6,'0')}_#{a.to_s.rjust(2,'0')}" + File.extname(f))
            a=a+1
          end
        end
      end

      # ZIP for 320 
      Zip::Archive.open(dest_path+"/ad_320/#{@ad.ad_type.file_prefix}/#{@ad.ad_type.file_prefix}_#{@ad.id.to_s.rjust(6,'0')}.zip", Zip::CREATE | Zip::TRUNC) do |ar|
        a=0
        @ad.ad_file.each do |af|
          Dir.glob(dir_path+af.id.to_s+'/client_320*.*') do |f|
            filename = File.basename(f, File.extname(f))
            FileUtils.cp(f,dir_path + "#{@ad.ad_type.file_prefix}_#{@ad.id.to_s.rjust(6,'0')}_#{a.to_s.rjust(2,'0')}" + File.extname(f))
            ar.add_file(dir_path + "#{@ad.ad_type.file_prefix}_#{@ad.id.to_s.rjust(6,'0')}_#{a.to_s.rjust(2,'0')}" + File.extname(f))
            a=a+1
          end
        end
      end

      # ZIP for 480 
      Zip::Archive.open(dest_path+"/ad_480/#{@ad.ad_type.file_prefix}/#{@ad.ad_type.file_prefix}_#{@ad.id.to_s.rjust(6,'0')}.zip", Zip::CREATE | Zip::TRUNC) do |ar|
        a=0
        @ad.ad_file.each do |af|
          Dir.glob(dir_path+af.id.to_s+'/client_480*.*') do |f|
            filename = File.basename(f, File.extname(f))
            FileUtils.cp(f,dir_path + "#{@ad.ad_type.file_prefix}_#{@ad.id.to_s.rjust(6,'0')}_#{a.to_s.rjust(2,'0')}" + File.extname(f))
            ar.add_file(dir_path + "#{@ad.ad_type.file_prefix}_#{@ad.id.to_s.rjust(6,'0')}_#{a.to_s.rjust(2,'0')}" + File.extname(f))
            a=a+1
          end
        end
      end
    # 리스트 광고 처리
    else
      if(@ad.ad_type_id>3)
        @ad.ad_file.each do |af|
          Dir.glob(dir_path+af.id.to_s+'/'+'small_thumb*.*') do |f|
            filename = File.basename(f, File.extname(f))
            FileUtils.cp(f,dest_path+"/ad_img/ad_list/#{@ad.ad_type.file_prefix}_pic_#{@ad.id.to_s.rjust(6,'0')}" + File.extname(f))
          end
        end
      end
      
      # a=0
      # @ad.ad_file.each do |af|
        # Dir.glob(dir_path+af.id.to_s+'/client_320*.*') do |f|
          # filename = File.basename(f, File.extname(f))
          # #FileUtils.cp(f,dest_path + "320/#{@ad.ad_type.file_prefix}_#{@ad.id.to_s.rjust(6,'0')}_#{a.to_s.rjust(2,'0')}" + File.extname(f))
          # a=a+1
        # end
      # end
# 
      # a=0
      # @ad.ad_file.each do |af|
        # Dir.glob(dir_path+af.id.to_s+'/client_480*.*') do |f|
          # filename = File.basename(f, File.extname(f))
          # #FileUtils.cp(f,dest_path + "480/#{@ad.ad_type.file_prefix}_#{@ad.id.to_s.rjust(6,'0')}_#{a.to_s.rjust(2,'0')}" + File.extname(f))
          # a=a+1
        # end
      # end
#       
      # a=0
      # @ad.ad_file.each do |af|
        # Dir.glob(dir_path+af.id.to_s+'/client_640*.*') do |f|
          # filename = File.basename(f, File.extname(f))
          # #FileUtils.cp(f,dest_path + "640/#{@ad.ad_type.file_prefix}_#{@ad.id.to_s.rjust(6,'0')}_#{a.to_s.rjust(2,'0')}" + File.extname(f))
          # a=a+1
        # end
      # end
   end

   #  # add file to zip archive

    # add file to zip archive from File object
    #ar << bar_txt # or ar.add_io(bar_txt)

    # add file to zip archive from buffer
    #ar.add_buffer('zoo.txt', 'Hello, world!')
    redirect_to ad_path(params[:ad_id])
  end
  
  
  def edit
    @ad_file = AdFile.find(params[:id])
  end
  
  def show
    @ad_file = AdFile.find(params[:id])
  end  
  
  def create
    @ad = Ad.find(params[:ad_id])    
    @ad_file = @ad.ad_file.create(params[:ad_file])
    
    redirect_to admin_ad_path(@ad)
  end
  
  def update
    @ad_file = AdFile.find(params[:id])
    
    respond_to do |format|
      if @ad_file.update_attributes(params[:ad_file])
        format.html { redirect_to @ad_file.ad, :notice => @controller_name +t(:message_success_update) }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ad_file.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @ad_file = AdFile.find(params[:id])
    @ad_file.destroy

    respond_to do |format|
      format.html { redirect_to ad_path(@ad_file.ad) }
      format.json { head :no_content }
    end
  end
end
