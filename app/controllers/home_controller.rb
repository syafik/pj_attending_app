class HomeController < ApplicationController
  protect_from_forgery :except => [:update_get_in, :update_get_out]
  #  before_filter :authenticate_user!

  def index
    @time_working = WorkingTime.last
    @users = Absent.where(' working_date BETWEEN ? AND ?' ,  DateTime.now.beginning_of_day.strftime("%Y-%m-%d %H:%M:%S"), DateTime.now.end_of_day.strftime("%Y-%m-%d %H:%M:%S")).all
    @absent = Absent.where('user_id = ? AND working_date BETWEEN ? AND ?' ,  current_user.id,  DateTime.now.beginning_of_day.strftime("%Y-%m-%d %H:%M:%S"), DateTime.now.end_of_day.strftime("%Y-%m-%d %H:%M:%S")).last unless current_user.blank?
    @user_ip = request.remote_ip

    respond_to do |format|
      format.html
      format.js
      format.json {render json: @absent}
    end
  end
  
  def update_get_in
    @absent = Absent.new(params["absent"])
    @absent.current_user = current_user
    if @absent.save
      flash[:alert] = "Check In Succes"
      p "Get In Succes"
    else
      flash[:alert] = "You have done check in"
      p "Get In Failed"
    end
  end
  
  def update_get_out
    @absent = Absent.where('user_id = ? AND working_date BETWEEN ? AND ?' ,  current_user.id,  DateTime.now.beginning_of_day.strftime("%Y-%m-%d %H:%M:%S"), DateTime.now.end_of_day.strftime("%Y-%m-%d %H:%M:%S")).last
    @absent.current_user = current_user
    if @absent.update_attributes(params["absent"])
      flash[:alert] = "Check Out Succes"
      p "Get Out Succes"
    else
      flash[:alert] = "You can't check out now "
      p "Get Out Failed"
    end
  end
 
end
