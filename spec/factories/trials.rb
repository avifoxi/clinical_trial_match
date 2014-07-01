# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trial do
    title { Faker::Name.name }
    description { Faker::Lorem.sentence }
    sponsor { Faker::Company.name }
    focus { Faker::Lorem.word}
    nct_id { "NCT0000" + Faker::Number.number(4) }
    originalminage { Faker::Number.number(2) }
    originalmaxage { Faker::Number.number(2) }

  end
end
