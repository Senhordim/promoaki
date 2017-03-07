# == Schema Information
#
# Table name: promotions
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  quantity    :integer
#  endDate     :date
#  segment_id  :integer
#  store_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Promotion < ApplicationRecord
  belongs_to :segment
  belongs_to :store
end
