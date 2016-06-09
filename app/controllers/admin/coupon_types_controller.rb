class Admin::CouponTypesController < Admin::AdminController
  # GET /coupon_types
  # GET /coupon_types.json
  def index
    @coupon_types = CouponType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coupon_types }
    end
  end

  # GET /coupon_types/1
  # GET /coupon_types/1.json
  def show
    @coupon_type = CouponType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coupon_type }
    end
  end

  # GET /coupon_types/new
  # GET /coupon_types/new.json
  def new
    @coupon_type = CouponType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coupon_type }
    end
  end

  # GET /coupon_types/1/edit
  def edit
    @coupon_type = CouponType.find(params[:id])
  end

  # POST /coupon_types
  # POST /coupon_types.json
  def create
    @coupon_type = CouponType.new(params[:coupon_type])

    respond_to do |format|
      if @coupon_type.save
        format.html { redirect_to admin_coupon_type_path(@coupon_type), :notice =>  @controller_name +t(:message_success_insert)}
        format.json { render json: @coupon_type, status: :created, location: @coupon_type }
      else
        format.html { render action: "new" }
        format.json { render json: @coupon_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coupon_types/1
  # PUT /coupon_types/1.json
  def update
    @coupon_type = CouponType.find(params[:id])

    respond_to do |format|
      if @coupon_type.update_attributes(params[:coupon_type])
        format.html { redirect_to admin_coupon_type_path(@coupon_type), :notice =>  @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coupon_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupon_types/1
  # DELETE /coupon_types/1.json
  def destroy
    @coupon_type = CouponType.find(params[:id])
    @coupon_type.destroy

    respond_to do |format|
      format.html { redirect_to admin_coupon_types_path }
      format.json { head :no_content }
    end
  end
end
