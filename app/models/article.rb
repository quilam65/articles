class Article < ApplicationRecord
  before_save :chage_time_zone
  has_many :texts
  has_many :images
  scope :public_article, -> {where('date_up <= ?', Time.now)}

  scope :private_article, -> {where('date_up > ?', Time.now)}
  private
    def chage_time_zone
      self.date_up.change(offset: Time.zone.now.strftime("%z"))
    end

end
