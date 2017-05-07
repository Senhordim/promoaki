# == Schema Information
#
# Table name: segments
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Segment < ApplicationRecord
  has_many :promotions, dependent: :destroy
  validates_presence_of :name
end
