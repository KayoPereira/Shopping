class District < ApplicationRecord
  belongs_to :city
  belongs_to :zone
end
