require 'rails_helper'

describe Api::V1::PromotionsController do

  describe "POST index" do

  	before do

  	  @longitude = '-25.436912'
  	  @latitude  = '-49.265020'

	  store1 = create(:store)
	  store2 = create(:store)
	  store3 = create(:store)
	  store4 = create(:store)
	  store5 = create(:store)
	  

	  address1 = create(:address, store_id: store1.id, street: 'Pia Lazari Bertoldi', numb: '3',  city: 'Curitiba', state: 'PR', country: 'Brasil')
	  address2 = create(:address, store_id: store2.id, street: 'Augusto Bertoldi',    numb: '13', city: 'Curitiba', state: 'PR', country: 'Brasil')
	  address3 = create(:address, store_id: store3.id, street: 'Marcos Bertoldi',     numb: '23', city: 'Curitiba', state: 'PR', country: 'Brasil')
	  address4 = create(:address, store_id: store4.id, street: 'Adolfo Ançay',        numb: '33', city: 'Curitiba', state: 'PR', country: 'Brasil')
	  address5 = create(:address, store_id: store5.id, street: 'Neusa Gusso',         numb: '43', city: 'Curitiba', state: 'PR', country: 'Brasil')
  	end

  	it "should find all promotions" do
  	Address.near([-25.594798, -49.339072], 5)

  	  post :index, params: { longitude: @longitude, latitude: @latitude}
  	end
  	
  end
end