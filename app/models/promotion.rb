class Promotion < ApplicationRecord
  belongs_to :segment
  belongs_to :store
end
