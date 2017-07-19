class ActivationAccountEmailDecorator
  def initialize(account)
    @account = account
  end

  def save
    @account.save && send_activation_email
  end

  # 有効化用のメールを送信する
  def send_activation_email
    AccountMailer.account_activation(@account).deliver_now
  end
end
