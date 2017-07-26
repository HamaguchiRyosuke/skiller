class Skill < ApplicationRecord
  has_many :teach_skills, dependent: :destroy
  has_many :learn_skills, dependent: :destroy
  has_many :users, through: :teach_skills
  has_many :users, through: :learn_skills
end
