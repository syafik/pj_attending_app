class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    auth = request.env["omniauth.auth"]
    p auth

    if user = User.find_by_uid(auth.uid)
      sign_in(user)
    elsif user_signed_in?
      current_user.update_attributes(:uid => auth.uid, :provider => auth.provider)
    end
    redirect_to root_path
  end
end