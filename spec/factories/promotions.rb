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

FactoryGirl.define do
  factory :promotion do
    title "Promoção teste"
    description "Uma simples promoção de desconto"
    quantity 10
    endDate Date.tomorrow
    segment {create(:segment)}
  end
end
