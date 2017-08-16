# == Schema Information
#
# Table name: cabins
#
#  id           :integer          not null, primary key
#  room         :string           not null
#  level        :string           not null
#  is_available :boolean          default(TRUE)
#  ship_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Cabin < ApplicationRecord
  belongs_to :ship
  validates :room, :level, presence: true
  validates :room, uniqueness: { scope: [:level, :ship_id] }
end
