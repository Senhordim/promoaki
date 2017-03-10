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

require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
