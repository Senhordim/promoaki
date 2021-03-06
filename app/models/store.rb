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

class Store < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :address, dependent: :destroy
  has_many :promotions, dependent: :destroy

  validates :social_name, :fantasy_name, :cnpj, :phone, presence: true
  validates :cnpj, uniqueness: true

  accepts_nested_attributes_for :address

  def cnpj_formatado
    cnpj.gsub(/\A(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})\Z/, "\\1.\\2.\\3/\\4-\\5")
  end

end
