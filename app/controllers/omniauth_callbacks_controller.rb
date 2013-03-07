class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    p auth = request.env["omniauth.auth"]

    if user = User.find_by_uid(auth.uid)
      sign_in(user)
    elsif user_signed_in?
      current_user.update_attribute("uid", auth.uid)
    end
    redirect_to root_path
  end
end