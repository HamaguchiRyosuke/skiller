class Account < ApplicationRecord
  attr_accessor :activation_token
  before_save :downcase_email
  before_create :create_activation_digest
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  class << self

    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  # 有効化用のメールを送信する
  def send_activation_email
    AccountMailer.account_activation(self).deliver_now
  end

  # アカウントを有効にする
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  # トークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private

  def downcase_email
    email.downcase!
  end

  def create_activation_digest
    self.activation_token = Account.new_token
    self.activation_digest = Account.digest(activation_token)
  end
end
