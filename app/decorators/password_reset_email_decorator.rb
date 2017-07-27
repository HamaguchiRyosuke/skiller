class PasswordResetEmailDecorator
  def initialize(account)
    @account = account
  end

  def reset_password
    create_reset_digest(@account) && send_password_reset_email(@account)
  end

  # パスワードリセットのメールを送信する
  def send_password_reset_email(account)
   AccountMailer.password_reset(account).deliver_now
  end

  def create_reset_digest(account)
    account.reset_token = Account.new_token
    account.update_attributes(reset_digest: Account.digest(account.reset_token), reset_sent_at: Time.zone.now)
  end
end
