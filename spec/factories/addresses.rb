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
    street "MyString"
    neighborhood "MyString"
    zip_code "MyString"
    numb "MyString"
    complement "MyString"
    city "MyString"
    state "MyString"
    store nil
  end
end
