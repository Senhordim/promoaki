class Api::V1::PromotionsController < Api::ApiController
   
  def index
  	@longitude = params[:longitude]
  	@latitude  = params[:latitude]
    
  	if some_address? && find_promotion?
      
  	  @address = Address.near([@longitude, @latitude], 15)
  	  find_promotions(@address)
  	  render_sucess(@promotions)
    else
    # Address.near([-25.594798, -49.339072], 5)
      render :json => { :status => "error", :message => "No pomotions yet" }
    
    end
  end


  private
  
  def find_promotions(addresses)
    
  	@addresses = addresses
  	@promotions = []
  	@addresses.each do |promo|
  	  @promotions << Promotion.find_by(store_id: promo.store_id)
  	end
  	@promotions
  end

  def find_promotion?
  	Promotion.any?
  end

  def render_sucess(object)
  	render :json => object, :status => 200
  end

  def some_address?
  	Address.geocoded.any?
  end
end

