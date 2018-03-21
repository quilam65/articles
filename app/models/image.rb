class Image < ApplicationRecord
  belongs_to :article

  validates :headline, :image, :no, presence: true
  mount_uploader :image, ImageUploader
end
