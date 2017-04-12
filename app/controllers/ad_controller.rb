class AdController < ApplicationController

  layout 'ad'

  # before_action :authenticate_store!, :except => [:api_promotions]
  before_action :authenticate_store!

end
