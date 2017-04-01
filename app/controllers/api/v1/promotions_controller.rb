
class Api::V1::PromotionsController < ApplicationController
  respond_to :json
 

  def index
    respond_with Promotion.all
  end
end

