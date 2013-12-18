class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
	
  helper :all
  protect_from_forgery
  helper_method  :require_user, :recipients

  private
  
  def recipients
   
    User.all.reject {|user| user == current_user}
    
  end
  
  def set_flash_message(key, kind, options = {})
    message = find_message(kind, options)
    flash[key] = message if message.present?
  end

  def find_message(kind, options = {})
    I18n.t("#{controller_name}.#{kind}", options)
  end

  

 

  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access this page"
      redirect_to signin_path
      return false
    end
  end
end
