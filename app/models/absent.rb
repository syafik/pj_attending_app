class Absent < ActiveRecord::Base
  attr_accessor :current_user
  belongs_to :user
  before_create :check_create
  before_update :check_update
  
  protected
  
  def check_create
  cond = Absent.where('user_id = ? AND DATE(working_date) = ?', current_user.id ,Date.today)
    if cond.count < 1
      p "you can get in"
      return true
    else
      p "you can not get in"
      return false
    end
  end
  
  def check_update
  cond = Absent.where('user_id = ? AND DATE(working_date) = ?', current_user.id ,Date.today)
    if cond.last.time_out.nil? & ((DateTime.now.strftime("%H").to_i - cond.last.time_in) >= WorkingTime.last.hour)
      p "you can update"
      return true
    else
      p "you can not update"
      return false
    end
  end
end
