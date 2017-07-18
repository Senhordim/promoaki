class Api::V1::PromotionsController < Api::ApiController

  before_filter :set_addresses, only: [:index]

  def index
  	if some_address? || find_promotion?
  	  render :json => { :status => "error", :message => "No pomotions yet" }
  	else
	  # Address.near([-25.594798, -49.339072], 5)

	  find_promotions(@address)
	  render_sucess(@promotions)
    end
  end

  private

  def set_addresses
    @longitude = params[:longitude]
    @latitude  = params[:latitude]
    distance = params[:distance].nil?  ? 20 : params[:distance] 

    @address = Address.near([@longitude, @latitude], distance)
    set_distance(@address)
  end

  def find_promotions(addresses)
  	@addresses = addresses
  	@promotions = []
  	@addresses.each do |promo|
  	  @promotions << Promotion.where(store_id: promo.store_id)
  	end
  	@promotions
  end

  def find_promotion?
  	Promotion.nil?
  end

  def render_sucess(object)
  	render :json => object, :status => 200
  end

  def some_address?
  	Address.geocoded.nil?
  end

  def set_distance(address)
    address.each do |add|
      store = Store.find(add.store_id)
      store.distance = distance(@latitude, @longitude, store.id)
      store.save
    end
  end

  def distance(latitude,longitude, store_id)
    address = Address.find_by(store_id: store_id)
    miles = Geocoder::Calculations.distance_between([address.latitude, address.longitude], [latitude, longitude])
    distance = (miles * 1.6).to_i
    distance
  end
end
