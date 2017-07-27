class LearnSkill < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :skill, optional: true
end
