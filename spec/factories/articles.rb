# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.words(4).join(' ') }
    body  { Faker::Lorem.paragraph }
  end
end
