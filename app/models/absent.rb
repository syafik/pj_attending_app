class Absent < ActiveRecord::Base
  attr_accessor :current_user
  belongs_to :user
  before_create :check_in
  before_update :check_out
  
  delegate :name, :address, :phone, to: :user, prefix: true, allow_nil: true

  protected
  
  def check_in
  cond = Absent.where('user_id = ? AND DATE(working_date) = ?', current_user.id ,Date.today)
    if cond.count < 1
      p "you can get in"
      return true
    else
      p "you can not get in"
      return false
    end
  end
  
  def check_out
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
