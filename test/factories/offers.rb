FactoryBot.define do
  factory :offer do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraphs(number: 2).join(" ") }
    price { 0 }
  end
end
