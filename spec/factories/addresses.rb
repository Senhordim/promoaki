# == Schema Information
#
# Table name: addresses
#
#  id           :integer          not null, primary key
#  street       :string
#  neighborhood :string
#  zip_code     :string
#  numb         :string
#  complement   :string
#  city         :string
#  state        :string
#  store_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  latitude     :float
#  longitude    :float
#  country      :string
#

FactoryGirl.define do
  factory :address do
    

    trait :full_address do
      street Faker::Address.street_name
      neighborhood "Centro"
      numb "23"
      complement "casa"
      city Faker::Address.city
      state Faker::Address.state_abbr
      longitude Faker::Address.longitude
      latitude  Faker::Address.latitude
    
    end
  end
end
