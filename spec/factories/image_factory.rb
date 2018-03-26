require 'faker'
FactoryBot.define do
  factory :image do
    headline 'Headline'
    no 1
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/logo.jpg')))
    article_id { create(:article).id }
    like 4
  end
end
