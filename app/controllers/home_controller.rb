class HomeController < ApplicationController
  before_filter :authenticate_admin!, except: [ :index]  
  
  def index  
    
    @script='home/index'
  end
  
  def no_auth
  
  end
end