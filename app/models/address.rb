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

class Address < ApplicationRecord

  belongs_to :store

  geocoded_by :full_address

  after_validation :geocode,
    if: -> (obj){ obj.street_changed? || obj.numb_changed? || obj.neighborhood_changed? || obj.city_changed? || obj.state_changed? }

  def full_address
    [street, numb, city, state, country].compact.join(', ')
  end

end

# '{"latitude": "-23.0099556", "longitude": "-45.5835282"}'

