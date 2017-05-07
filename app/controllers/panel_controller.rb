class PanelController < ApplicationController

  layout 'panel'

  before_action :authenticate_admin!

  def pundit_user
    current_admin
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Você não tem autorização para executar essa ação!"
    redirect_to(request.referrer || panel_root_path)
  end

  def after_sign_in_path_for(resource)
    panel_root_path
  end

end
