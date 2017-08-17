# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  country    :string           not null
#  photo      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class City < ApplicationRecord
  has_and_belongs_to_many :cruises
  validates :name, :country, presence: true
  validates :name, uniqueness: {scope: [:country]}
end
