ActiveAdmin.register Absent do
  before_filter { @skip_sidebar = true }    
  
  scope :all, :default => true do |absents|
    absents.includes [:user]
  end
  
  scope :due_this_day do |absents|
    absents.includes [:user]
    absents.where(' working_date BETWEEN ? AND ?' ,  DateTime.now.beginning_of_day.strftime("%Y-%m-%d %H:%M:%S"), DateTime.now.end_of_day.strftime("%Y-%m-%d %H:%M:%S"))
  end
     
  scope :due_this_week do |absents|
    absents.includes [:user]
    absents.where(' working_date BETWEEN ? AND ?' ,  DateTime.now.beginning_of_week.strftime("%Y-%m-%d %H:%M:%S"), DateTime.now.end_of_week.strftime("%Y-%m-%d %H:%M:%S"))
  end
      
  scope :due_this_month do |absents|
    absents.includes [:user]
    absents.where(' working_date BETWEEN ? AND ?' ,  DateTime.now.beginning_of_month.strftime("%Y-%m-%d %H:%M:%S"), DateTime.now.end_of_month.strftime("%Y-%m-%d %H:%M:%S"))
  end
  
  
  index do
    column :user_name
    column :user_address
    column :user_phone
    column :time_in
    column :time_out
    default_actions
  end
  
end
