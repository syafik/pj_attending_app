class Absent < ActiveRecord::Base
  attr_accessor :current_user
  belongs_to :user
  before_create :check_create
  before_update :check_update
  
  protected
  def check_create
    if Absent.where('user_id = ? AND DATE(working_date) = ?', current_user.id ,Date.today).count < 1
      p "you can get in"
      return true
    else
      p "you can not get in"
      return false
    end
  end
  
  def check_update
    if Absent.last.time_out.nil?
      p "you can update"
      return true
    else
      p "you can not update"
      return false
    end
  end
end
