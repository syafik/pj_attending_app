ActiveAdmin.register User do
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
end
