class User < ApplicationRecord
  belongs_to :account
  has_many :teach_skills, dependent: :destroy
  has_many :learn_skills, dependent: :destroy
  has_many :skills, through: :teach_skills
  has_many :skills, through: :learn_skills
  accepts_nested_attributes_for :teach_skills, allow_destroy: true
  accepts_nested_attributes_for :learn_skills, allow_destroy: true


  validates :account_id, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :gender, presence: true, length: { maximum: 10 }
  validates :age, presence: true, length: { maximum: 4 }

  def save_skills(tags)
    current_tags = self.skills.pluck(:skill_title) unless self.skills.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_skill_title|
      self.skills.delete Skill.find_by(skill_title: old_skill_title)
    end

    # Create new taggings:
    new_tags.each do |new_skill_title|
      teach_skill = Skill.find_or_create_by(skill_title: new_skill_title)
      self.skills << teach_skill
    end
  end
end
