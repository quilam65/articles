FactoryBot.define do
  factory :image do
    headline 'Headline'
    no 1
    image 'acbde.jpg'
    article_id { create(:article).id }
    like 4
  end
end
