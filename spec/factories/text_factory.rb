FactoryBot.define do
  factory :text do
    headline 'Headline'
    no 2
    content 'aadd a da d ad a '
    article_id { create(:article).id }
    like 5
  end
end
