ActiveAdmin.register WorkingTime do
  before_filter { @skip_sidebar = true }
  
  index do
    h2 "First record is used"
    column :hour
    column :first_check_in
    column :last_check_in
    column :first_check_out
    column :last_check_out
    default_actions
  end
end
