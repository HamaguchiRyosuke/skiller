class User < ApplicationRecord
  belongs_to :account
  has_many :skills, through: :teach_skills
  belongs_to :teach_skills
  validates :account_id, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :gender, presence: true, length: { maximum: 10 }
  validates :age, presence: true, length: { maximum: 4 }
end
