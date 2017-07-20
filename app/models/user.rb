class User < ApplicationRecord
  belongs_to :account
  validates :account_id, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :gender, presence: true, length: { maximum: 10 }
  validates :age, presence: true, length: { maximum: 4 }
end
