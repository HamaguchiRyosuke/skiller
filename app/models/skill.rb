class Skill < ApplicationRecord
  has_many :users, through: :teach_skills
  has_many :teach_skills
end
