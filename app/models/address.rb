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
#

class Address < ApplicationRecord
  belongs_to :store
end
