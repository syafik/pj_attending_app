AdminUser.delete_all
AdminUser.create(:email => "pushjaw@pushjaw.com", :password => "12345678")

WorkingTime.delete_all
WorkingTime.create(:hour => 8, :first_check_in => 8, :last_check_in => 11, :first_check_out => 17, :last_check_out => 22)

User.delete_all
10.times do |user|
  user = User.create(:email => "pushjaw#{user+1}@pushjaw.com", :name => "pushjaw",
    :address => "jl. mig 3 no 1", :phone => "1234567890", :password => "12345678")
end

Absent.delete_all