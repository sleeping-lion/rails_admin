class ApplicationController < ActionController::Base 
  protect_from_forgery 
  layout :layout
  before_filter :set_locale
  before_filter :authenticate_admin!,:only => [:index,:new,:create,:show,:edit, :update, :destroy]
  
  def initialize(*params)
    super(*params)
    
    @style='application'
    @script='application'
  end
  
  def current_ability
    @current_ability ||= AdminAbility.new(current_admin)        
  end
  
  def set_locale
     I18n.locale = 'ko'
     I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def layout
    if(params[:no_layout])
      return nil
    else
      return 'application'
    end
  end
end
