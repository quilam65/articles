class Image < ApplicationRecord
  belongs_to :article

  validates :headline, :image, :no, presence: true
  validates :like, numericality: { greater_than: -1 }
  mount_uploader :image, ImageUploader
end
