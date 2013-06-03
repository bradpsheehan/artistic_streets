class Art < ActiveRecord::Base
  attr_accessible :artist, :comment, :title, :location_attributes, :image

  has_one :location
  validates_associated :location
  accepts_nested_attributes_for :location

  has_attached_file :image
end
