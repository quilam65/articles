class Image < ApplicationRecord
  belongs_to :article

  validates :headline, :image, :no, presence: true

end
