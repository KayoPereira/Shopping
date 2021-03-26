class District < ApplicationRecord
  belongs_to :cities
  has_many :zones
end
