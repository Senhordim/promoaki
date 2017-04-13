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
#  cod         :string
#

class Promotion < ApplicationRecord
  belongs_to :segment
  belongs_to :store

  validates_presence_of :title, :description

  before_create :generate_code

  private

  def generate_code
    self.cod = "#" + store_id.to_s + Date.today.to_formatted_s(:number).to_s + id.to_s
  end

end
