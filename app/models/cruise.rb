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
  has_and_belongs_to_many :cities
  belongs_to :ship
  validates :name, presence: true
  validates :name, uniqueness: true
end
