class Organization < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  has_many :needs

end
