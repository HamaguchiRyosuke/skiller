class SendActivationEmailDecorator

  def initialize(account)
    @account = account
  end

  def save
    if @account.save
      @account.send_activation_email
      return true
    else
      return false
    end
  end
end
