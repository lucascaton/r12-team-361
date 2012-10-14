class UserPresenter < Presenter
  def display_information
    if user_signed_in?
      render "users/info", user: self
    else
      render "users/sign_in_links", sign_in_via_facebook_path: user_omniauth_authorize_path(:facebook)
    end
  end

  def facebook_avatar
    image_tag("http://graph.facebook.com/#{facebook_uid}/picture?type=square", alt: "Facebook avatar")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def logout_link
    link_to(%{<i class="icon-white icon-off"></i> Logout}.html_safe, destroy_user_session_path, method: :delete)
  end

  def upload_button_class
    unless user_signed_in?
      "btn btn-upload disabled"
    else
      "btn btn-upload"
    end
  end

  protected

  def user_signed_in?
    target.present?
  end
end