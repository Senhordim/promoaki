require 'rails_helper'

describe Ad::PromotionsController do
  before do
      @store = create(:store)
  end

  describe 'Main actions' do
    
    describe 'index' do
      it 'should list all promotions' do
        store = create(:promotion, store: @store)
        get :index
        expect(response).to render_template('index')
      end
    end

    describe 'new' do
      render_views
      it "renders :new template" do
        get :new
        expect(response).to render_template(:new)
      end

      it "assigns new Promotion to @promotion" do
        get :new
        expect(assigns(:promotion)).to be_a_new(Promotion)
      end
    end

    describe "show" do
      
      let(:promotion){ create(:promotion, store_id: @store.id)}
      it "renders :show template" do
        get :show, id: promotion
        expect(response).to render_template(:show)
      end
   end

   describe "create" do
     it "redirects to promotion#show" do
       post :create, promotion: FactoryGirl.attributes_for(:promotion)
       expect(response).to redirect_to(ad_promotions_path)
     end
     
     
     it 'creates a new promotion in database' do
       expect {
         post :create, promotion: FactoryGirl.attributes_for(:promotion)
       }.to change(Promotion, :count).by(1)
     end
   end
  end
end