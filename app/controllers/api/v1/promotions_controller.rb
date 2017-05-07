class Api::V1::PromotionsController < Api::ApiController

  def index
  	@longitude = params[:longitude]
  	@latitude  = params[:latitude]

  	if some_address? || find_promotion?
  	  render :json => { :status => "error", :message => "No pomotions yet" }
  	else
	  # Address.near([-25.594798, -49.339072], 5)
	  @address = Address.near([@longitude, @latitude], 20)
	  find_promotions(@address)
	  render_sucess(@promotions, @distance)
    end
  end

  private

  def find_promotions(addresses)
  	@addresses = addresses
  	@promotions = []
  	@addresses.each do |promo|
  	  @promotions << Promotion.where(store_id: promo.store_id)
      @promotions << distance(@latitude, @longitude, promo.store_id)
  	end
  	@promotions
  end

  def find_promotion?
  	Promotion.nil?
  end

  def render_sucess(object,object2=nil)
  	render :json => object, :status => 200
  end

  def some_address?
  	Address.geocoded.nil?
  end

  def distance(latitude,longitude, store_id)
    address = Address.find_by(store_id: store_id)
    miles = Geocoder::Calculations.distance_between([address.latitude, address.longitude], [latitude, longitude]).to_i
    distance = miles * 1.6
    distance
  end
end
