FactoryGirl.define do
  factory :account do
    email 'example@sample.com'
    password 'password'
    password_confirmation 'password'
    activated true
    activated_at Time.zone.now
    admin true
  end

  factory :other_account, parent: :account do
    other true
    email "other@example.com"
    admin false
  end

  factory :crowds_account, parent: :account do
    crowds true
    activated_at true
    admin false
  end
end
