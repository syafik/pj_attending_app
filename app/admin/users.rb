ActiveAdmin.register User do
  before_filter { @skip_sidebar = true }
  User.has_many :Abssents

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :address
      f.input :phone
      f.input :password
    end
    f.buttons
  end
  
  index do
    column :name
    column :email
    column :address
    column :phone
    default_actions
  end
  # Filter only by title
  filter :name

  config.per_page = 10
end
