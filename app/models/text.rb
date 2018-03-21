class Text < ApplicationRecord
  belongs_to :article
  validates :headline, :no, :content, presence: true
  validates :like, numericality: { greater_than: 0 }
end
