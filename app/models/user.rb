class User < ApplicationRecord
  belongs_to :account
  has_many :teach_skills, dependent: :destroy
  has_many :learn_skills, dependent: :destroy
#  has_many :skills, through: :teach_skills
#  has_many :skills, through: :learn_skills
  accepts_nested_attributes_for :teach_skills, allow_destroy: true
  accepts_nested_attributes_for :learn_skills, allow_destroy: true


  # validates :account_id, presence: true
  # validates :name, presence: true, length: { maximum: 30 }
  # validates :gender, presence: true, length: { maximum: 10 }
  # validates :age, presence: true, length: { maximum: 4 }
end
