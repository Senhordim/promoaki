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

require 'rails_helper'

describe Promotion do
  it{should belong_to :store}
  it{should belong_to :segment}
  it{should validate_presence_of :title}
  it{should validate_presence_of :description}
  it{should validate_presence_of :endDate}
end
