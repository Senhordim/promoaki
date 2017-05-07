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
  include ActiveModel::Serialization

  belongs_to :segment
  belongs_to :store

  paginates_per 7

  validates_presence_of :title, :description

  before_save :generate_code

  scope :by_cod, -> (cod) { where("lower(cod) like ?", "%#{cod}%".downcase) }
  scope :by_title, -> (title) { where("lower(title) like ?", "%#{title}%".downcase)}

  scope :by_period, -> created_at, endDate { where("created_at = ? AND endDate = ?", created_at, endDate) }

  def attributes
    { 'id' => id, 'title' => title, 'store_address' => store_address, 'description' => description,
      'quantity' => quantity, 'endDate' => endDate, 'segment' => segment.name,
      'store' => store.social_name, 'created_at' => created_at, 'updated_at' => updated_at,
      'cod' => cod}
  end

  private

  def generate_code
    self.cod = "#" + Date.today.to_formatted_s(:number).to_s +
    store_id.to_s + Random.rand(0...100).to_s +  Random.rand(0...10).to_s
  end

  def store_address
    store = Store.find(store_id).address
    return store.longitude, store.latitude
  end
end
