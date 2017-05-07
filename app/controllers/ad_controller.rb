class AdController < ApplicationController

  layout 'ad'

  # before_action :authenticate_store!, :except => [:api_promotions]
  before_action :authenticate_store!

  private

  def after_sign_in_path_for(resource)
    ad_root_path
  end

end
