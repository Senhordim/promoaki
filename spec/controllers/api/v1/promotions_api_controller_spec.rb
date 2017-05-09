require 'rails_helper'

describe Api::V1::PromotionsController do

  describe "POST index" do

  	before do

  	  @longitude = '-25.436912'
  	  @latitude  = '-49.265020'

	  store1 = create(:store)
	  store2 = create(:store)

	  address1 = create(:address, store_id: store1.id, street: 'Pia Lazari Bertoldi', numb: '3',  city: 'Curitiba', state: 'PR', country: 'Brasil')
	  address2 = create(:address, store_id: store2.id, street: 'Augusto Bertoldi',    numb: '13', city: 'Curitiba', state: 'PR', country: 'Brasil')

	  promotion1 = create(:promotion, store_id: store1.id)
	  promotion2 = create(:promotion, store_id: store2.id)
  	end

  	it "should find promotions near" do
  	  post :index, params: { longitude: @longitude, latitude: @latitude}
  	  json = JSON.parse(response.body)
  	  expect(response).to be_success
  	  expect(json.length).to eq(2)
  	end

    it 'should have some attributes' do
      post :index, params: { longitude: @longitude, latitude: @latitude}
  	  json = JSON.parse(response.body)

      expect(json).to have_content "distance_to"
      expect(json).to have_content "title"
      expect(json).to have_content "store_name"
      expect(json).to have_content "description"
      expect(json).to have_content "endDate"
      expect(json).to have_content "store_address"
      expect(json).to have_content "cod"
    end

  end
end
