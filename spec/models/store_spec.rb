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

require 'rails_helper'

RSpec.describe Store, type: :model do
   it { should validate_presence_of(:social_name ) }
   it { should validate_presence_of(:fantasy_name ) }
   it { should validate_presence_of(:cnpj ) }
   it { should validate_uniqueness_of(:cnpj ) }
   it { should validate_presence_of(:phone ) }

   it { is_expected.to have_one(:address)}
end
