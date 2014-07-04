require 'faker'

FactoryGirl.define do
    factory :user do
        email { Faker:: Internet.email }
        password 'secret123'
        password_confirmation 'secret123'

        factory :admin do
            admin true
        end
    end
end

