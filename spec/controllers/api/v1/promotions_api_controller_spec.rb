require 'rails_helper'

describe Api::V1::PromotionsController do
	
  describe "get index" do
	it "should return all promotions" do
	  get :index
	  expect(response).to have_http_status(:success)  		
	end  	
  end
end