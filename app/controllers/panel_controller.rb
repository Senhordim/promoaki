class PanelController < ApplicationController

  layout 'panel'

  before_action :authenticate_admin!

  def pundit_user
    current_admin
  end

  private

  def after_sign_in_path_for(resource)
    panel_root_path
  end

end
