class Text < ApplicationRecord
  belongs_to :article
  validates :headline, :no, :content, presence: true
end
