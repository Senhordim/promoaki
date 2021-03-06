# == Schema Information
#
# Table name: stores
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  social_name            :string
#  fantasy_name           :string
#  cnpj                   :string
#  phone                  :string
#

FactoryGirl.define do
  factory :store do
    email {Faker::Internet.email}
    social_name {Faker::Company.name}
    fantasy_name {Faker::Company.name}
    cnpj {Faker::Company.swedish_organisation_number}
    phone {Faker::PhoneNumber.cell_phone}
    password 'qweqwe123'
  end
end


