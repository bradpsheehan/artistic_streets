class Art < ActiveRecord::Base
  attr_accessible :artist, :comment, :title, :location_attributes

  has_one :location
  validates_associated :location
  accepts_nested_attributes_for :location
end
