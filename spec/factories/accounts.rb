FactoryGirl.define do
  factory :account do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    activated true
    activated_at Time.zone.now
  end

  factory :other, class: Account do
    email "other@example.com"
    password 'password'
    password_confirmation 'password'
    activated true
    activated_at Time.zone.now
  end

  factory :crowds, class: Account do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    activated true
    activated_at true
  end
end
