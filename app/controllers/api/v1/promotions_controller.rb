class Api::V1::PromotionsController < Api::ApiController
  respond_to :json
 
  def index
  	require 'pry'; binding.pry
  	@longitude = params[:longitude]
  	@latitude  = params[:latitude]

   # Address.near([-25.594798, -49.339072], 5)
    @address = Address.near([@longitude, @latitude], 15)

      require 'pry'; binding.pry
  end
end

