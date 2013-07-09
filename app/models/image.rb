class Image < ActiveRecord::Base
  attr_accessible :photo
  belongs_to :art

  has_attached_file :image, storage: :s3, styles: { medium: "300x300>", thumb: "100x100>" }
end
