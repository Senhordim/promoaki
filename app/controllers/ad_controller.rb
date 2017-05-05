class AdController < ApplicationController

  layout 'ad'

  # before_action :authenticate_store!, :except => [:api_promotions]
  before_action :authenticate_store!

  before_action :configure_permitted_parameters, if: :devise_controller?

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

  private

  def after_sign_in_path_for(resource)
    ad_root_path
  end

end
