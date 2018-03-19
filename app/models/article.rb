class Article < ApplicationRecord
  has_many :texts
  has_many :images
end
