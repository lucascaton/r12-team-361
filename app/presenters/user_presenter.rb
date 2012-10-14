class UserPresenter < Presenter
  def new_video_modal_partial
    if user_signed_in?
      render "videos/new"
    end
  end

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

  protected

  def user_signed_in?
    target.present?
  end
end