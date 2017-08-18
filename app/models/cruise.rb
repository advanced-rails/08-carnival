# == Schema Information
#
# Table name: cruises
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  duration   :integer          default(0)
#  base_cost  :decimal(, )      default(0.0)
#  dates      :date             default([]), is an Array
#  ship_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cruise < ApplicationRecord
  belongs_to :ship
  has_and_belongs_to_many :cities
  has_many :reservations
  has_many :users, through: :reservations
  validates :name, presence: true
  validates :name, uniqueness: true
end
