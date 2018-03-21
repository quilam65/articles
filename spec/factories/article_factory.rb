FactoryBot.define do
  factory :article do
    title 'Title'
    date_up Time.now
    like 3
  end
end
