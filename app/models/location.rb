class Location < ActiveRecord::Base
  belongs_to :art

  geocoded_by :address
  before_save :geocode, if: :address_changed?
end
