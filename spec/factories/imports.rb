# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :import do
    datetime { DateTime.now }
    valid_trials { Faker::Number.number(2) }
    valid_sites { Faker::Number.number(2) }
  end
end
