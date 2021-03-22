class District < ApplicationRecord
  belongs_to :cities
  belongs_to :zones
end
