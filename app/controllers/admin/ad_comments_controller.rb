class Admin::AdCommentsController < Admin::AdminController
  # GET /ad_comments
  # GET /ad_comments.json
  def index
    @ad_comments = AdComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ad_comments }
    end
  end

  # GET /ad_comments/1
  # GET /ad_comments/1.json
  def show
    @ad_comment = AdComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ad_comment }
    end
  end

  # GET /ad_comments/new
  # GET /ad_comments/new.json
  def new
    @ad_comment = AdComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ad_comment }
    end
  end

  # GET /ad_comments/1/edit
  def edit
    @ad_comment = AdComment.find(params[:id])
  end

  # POST /ad_comments
  # POST /ad_comments.json
  def create
    @ad_comment = AdComment.new(params[:ad_comment])

    respond_to do |format|
      if @ad_comment.save
        format.html { redirect_to @ad_comment, notice: 'Ad comment was successfully created.' }
        format.json { render json: @ad_comment, status: :created, location: @ad_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @ad_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ad_comments/1
  # PUT /ad_comments/1.json
  def update
    @ad_comment = AdComment.find(params[:id])

    respond_to do |format|
      if @ad_comment.update_attributes(params[:ad_comment])
        format.html { redirect_to @ad_comment, notice: 'Ad comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ad_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_comments/1
  # DELETE /ad_comments/1.json
  def destroy
    @ad_comment = AdComment.find(params[:id])
    @ad_comment.destroy

    respond_to do |format|
      format.html { redirect_to ad_comments_url }
      format.json { head :no_content }
    end
  end
end
