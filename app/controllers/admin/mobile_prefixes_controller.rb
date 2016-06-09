class Admin::MobilePrefixesController < ApplicationController
  # GET /mobile_prefixes
  # GET /mobile_prefixes.json
  def index
    @mobile_prefixes = MobilePrefix.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mobile_prefixes }
    end
  end

  # GET /mobile_prefixes/1
  # GET /mobile_prefixes/1.json
  def show
    @mobile_prefix = MobilePrefix.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mobile_prefix }
    end
  end

  # GET /mobile_prefixes/new
  # GET /mobile_prefixes/new.json
  def new
    @mobile_prefix = MobilePrefix.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mobile_prefix }
    end
  end

  # GET /mobile_prefixes/1/edit
  def edit
    @mobile_prefix = MobilePrefix.find(params[:id])
  end

  # POST /mobile_prefixes
  # POST /mobile_prefixes.json
  def create
    @mobile_prefix = MobilePrefix.new(params[:mobile_prefix])

    respond_to do |format|
      if @mobile_prefix.save
        format.html { redirect_to admin_mobile_prefixe_path(@mobile_prefix), notice: 'Mobile prefix was successfully created.' }
        format.json { render json: @mobile_prefix, status: :created, location: @mobile_prefix }
      else
        format.html { render action: "new" }
        format.json { render json: @mobile_prefix.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mobile_prefixes/1
  # PUT /mobile_prefixes/1.json
  def update
    @mobile_prefix = MobilePrefix.find(params[:id])

    respond_to do |format|
      if @mobile_prefix.update_attributes(params[:mobile_prefix])
        format.html { redirect_to admin_mobile_prefixe_path(@mobile_prefix), notice: 'Mobile prefix was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mobile_prefix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mobile_prefixes/1
  # DELETE /mobile_prefixes/1.json
  def destroy
    @mobile_prefix = MobilePrefix.find(params[:id])
    @mobile_prefix.destroy

    respond_to do |format|
      format.html { redirect_to admin_mobile_prefixes_path }
      format.json { head :no_content }
    end
  end
end
