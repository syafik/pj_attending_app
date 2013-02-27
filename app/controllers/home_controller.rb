class HomeController < ApplicationController
  protect_from_forgery :except => [:update_get_in, :update_get_out]
  before_filter :authenticate_user!
    
  def index
    @absent = Absent.where('user_id = ? AND working_date BETWEEN ? AND ?' ,  current_user.id,  DateTime.now.beginning_of_day.strftime("%Y-%m-%d %H:%M:%S"), DateTime.now.end_of_day.strftime("%Y-%m-%d %H:%M:%S")).last
    @users = User.all
  end
  
  def update_get_in
    @absent = Absent.new(params["absent"])
    @absent.current_user = current_user
    if @absent.save
      p "Get In Succes"
    else
      p "Get In Failed"
    end
  end
  
  def update_get_out
    @absent = Absent.where('user_id = ? AND working_date BETWEEN ? AND ?' ,  current_user.id,  DateTime.now.beginning_of_day.strftime("%Y-%m-%d %H:%M:%S"), DateTime.now.end_of_day.strftime("%Y-%m-%d %H:%M:%S")).last
#    @absent.current_user = current_user
    if @absent.update_attributes(params["absent"])
      p "Get Out Succes"
    else
      p "Get Out Failed"
    end
  end
 
end
