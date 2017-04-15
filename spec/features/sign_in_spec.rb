require 'rails_helper'

describe "the signin process", :type => :feature do
	before :each do
	  @store = create(:store)
	end

	it 'sign me in' do
	  visit '/stores/sign_in'
	  	fill_in 'store[email]', with: @store.email
	  	fill_in 'store[password]', with: @store.password

	  click_button 'Entrar'
	  expect(page).to have_content 'Login '
	end

	it "signup" do
		visit 'stores/sign_up'
			fill_in 'store[fantasy_name]',         with: "Empresa for test"
			fill_in 'store[social_name]',          with: "My company"
			fill_in 'store[cnpj]',                 with: '16734827000169'
			fill_in 'store[phone]',                with: '33380098'
			fill_in 'store[email]', 	           with: 'empresax@gmail.com'
			fill_in 'store[password]',             with: 'qweqwe123'
			fill_in 'store[password_confirmation]', with: 'qweqw123'

		expect{
      click_button 'Criar conta'
    }.to change(Store, :count).by(1)
		
	end
	
end