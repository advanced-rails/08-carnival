# == Schema Information
#
# Table name: reservations
#
#  id         :integer          not null, primary key
#  date       :date             not null
#  room       :string           not null
#  level      :integer          not null
#  cost       :decimal(, )      not null
#  user_id    :integer          not null
#  cruise_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Reservation < ApplicationRecord
  validates :date, :room, :level, :cost, :user_id, :cruise_id, presence: true
  belongs_to :user
  belongs_to :cruise
end
