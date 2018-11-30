class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = UserProvider.find_user(auth)
    update_users_avatar if avatar_needs_updated?

    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, :kind => provider_title)
    else
      session[provider_data] = auth
      redirect_to new_user_registration_url
    end
  end
  alias_method :google_oauth2, :facebook
  alias_method :github, :google_oauth2


  def failure
    flash[:alert] = 'Authentication failed.'
    redirect_to root_path
  end


  private

  def provider_title
    auth.provider.capitalize
  end

  def provider_data
    "#devise.#{auth}_data"
  end

  def auth
    request.env['omniauth.auth']
  end

  def update_users_avatar
    @user.update_avatar(avatar_from_provider)
  end

  def avatar_needs_updated?
    avatar_from_provider != @user.avatar
  end

  def avatar_from_provider
    @avatar_from_provider ||= auth.info.image
  end
end
