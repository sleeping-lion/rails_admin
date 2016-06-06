# encoding: utf-8
class Admin::UserAddressBooksController < Admin::AdminController
  # GET /user_address_books
  # GET /user_address_books.json
  impressionist
  
  def initialize(*params)
    super(*params)

    @category=t(:menu_user)
    @sub_menu=t(:submenu_user_address_book)
    @controller_name=t('activerecord.models.user_address_book')
  end

  def index
    unless params[:per_page].present?
      params[:per_page]=20
    end

    unless params[:page].present?
      params[:page]=1
    end

    @user_address_book_count = UserAddressBook.count()
    @user_address_books = UserAddressBook.order('id desc').page(params[:page]).per(params[:per_page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @user_address_books }
    end
  end

  # GET /user_address_books/1
  # GET /user_address_books/1.json
  def show
    @user_address_book = UserAddressBook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user_address_book }
    end
  end

  # GET /user_address_books/new
  # GET /user_address_books/new.json
  def new
    @user_address_book = UserAddressBook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user_address_book }
    end
  end

  # GET /user_address_books/1/edit
  def edit
    @user_address_book = UserAddressBook.find(params[:id])
  end

  # POST /user_address_books
  # POST /user_address_books.json
  def create
    @user_address_book = UserAddressBook.new(params[:user_address_book])

    respond_to do |format|
      if @user_address_book.save
        format.html { redirect_to admin_user_address_book_path(@user_address_book), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @user_address_book, status: :created, location: @user_address_book }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user_address_book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_address_books/1
  # PUT /user_address_books/1.json
  def update
    @user_address_book = UserAddressBook.find(params[:id])

    respond_to do |format|
      if @user_address_book.update_attributes(params[:user_address_book])
        format.html { redirect_to admin_user_address_book_path(@user_address_book), :notice=> @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user_address_book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_address_books/1
  # DELETE /user_address_books/1.json
  def destroy
    @user_address_book = UserAddressBook.find(params[:id])
    @user_address_book.destroy

    respond_to do |format|
      format.html { redirect_to admin_user_address_books_path }
      format.json { head :no_content }
    end
  end
end
