FactoryGirl.define do
  factory :account do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    activated true
    activated_at Time.zone.now
  end

  factory :other_account, parent: :account do
    other true
    email "other@example.com"
  end

  factory :crowds_account, parent: :account do
    crowds true
    activated_at true
  end
end
