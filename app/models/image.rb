class Image < ActiveRecord::Base
  belongs_to :art

  has_attached_file :image, storage: :s3, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

  def url(size)
    image.url(size)
  end
end
