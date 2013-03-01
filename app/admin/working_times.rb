ActiveAdmin.register WorkingTime do
  before_filter { @skip_sidebar = true }
  
  index do
    h2 "First record is used"
    column :hour
    default_actions
  end
end
