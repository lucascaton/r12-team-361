class BabycastsOmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook(auth_hash)
    @user_authentication = Babycasts::UserAuthentication.new(auth_hash, user: @user)

    if @user_authentication.save
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      Rails.logger.error "Error logging in with Facebook: #{@user.errors.full_messages.to_sentence}."
      redirect_to root_path
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end