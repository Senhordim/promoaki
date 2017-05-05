class PanelController < ApplicationController

  layout 'panel'

  # before_action :authenticate_store!, :except => [:api_promotions]
  before_action :authenticate_admin!

  private

  def after_sign_in_path_for(resource)
    panel_root_path
  end

end
