class Organization < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  has_many :needs, :dependent => :delete_all
  belongs_to :user, optional: true

end
