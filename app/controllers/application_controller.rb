class ApplicationController < ActionController::Base
  protect_from_forgery
  
#  def after_sign_in_path_for(resource)
#    p current_user
#    p current_admin_user
##    if resource.is_a?(User)
#      index_home_path
##    elsif resource.is_a?(AdminUser)
##      admin_root_path
##    end
#  end
  
end
