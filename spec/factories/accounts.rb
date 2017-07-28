FactoryGirl.define do
  factory :account do
    email 'example@sample.com'
    password 'password'
    password_confirmation 'password'
    activated true
    activated_at Time.zone.now
    admin true

    trait :other do
      email { Faker::Internet.email }
      admin false
    end
  end
end
