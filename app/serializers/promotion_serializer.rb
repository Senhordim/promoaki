class PromotionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :quantity, :endDate, :segment_id,
             :store_id, :created_at, :updated_at, :cod, :store_address

  # belongs_to :segment
  # belongs_to :store
end
