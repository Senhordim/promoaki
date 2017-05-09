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
    { 'id' => id, 'title' => title, 'store_name' => store_name, 'description' => description,
      'endDate' => endDate, 'store_address' => store_address, 'cod' => cod, 'distance_to' => distance_to}
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

  def store_name
    store = find_store
    return store.social_name
  end

  def distance_to
    store = find_store
    return store.distance
  end

  def find_store
    store = Store.find(store_id)
  end
end
