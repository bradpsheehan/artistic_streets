class Image < ActiveRecord::Base
  attr_accessible :image, :image_attributes, :art_id
  belongs_to :art

  has_attached_file :image, storage: :s3, styles: { medium: "300x300>", thumb: "100x100>" }

  def url(size)
    image.url(size)
  end
end
