# == Schema Information
#
# Table name: ships
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  photo      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ship < ApplicationRecord
  has_many :cabins, dependent: :delete_all
  validates :name, presence: true
  validates :name, uniqueness: true
end
