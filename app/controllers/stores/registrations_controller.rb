class Stores::RegistrationsController < Devise::RegistrationsController

  layout :admin_layout

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def admin_layout
    current_store.present? ? 'ad' : 'auth'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(
        :email, :password,
        :password_confirmation,
        :phone,
        :cnpj,
        :social_name,
        :fantasy_name)
    end
  end

  def after_update_path_for(resource)
    store_session_path
  end

end
