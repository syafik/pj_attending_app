ActiveAdmin.register WorkingTime do
  index do
    h2 "Last record is used"
    column :hour
    default_actions
  end
end
