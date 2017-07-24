FactoryGirl.define do
  factory :user do
    name "Example User"
    gender "male"
    age 22
    teach_skill "Ruby"
    learn_skill "Python"
    other_information "Hi, I want to learn Python"
  end

  factory :other_user, parent: :user do
    other true
    name "John"
    learn_skill "Unity"
    other_information "Hi, I want to learn Unity"
  end

  factory :crowds_user, parent: :user do
    crowds true
    name "Haruka"
    gender "female"
    teach_skill "English"
    other_information "Hi, I have TOIEC score 945points! So I teach you English! I want to learn Python"
  end
end
