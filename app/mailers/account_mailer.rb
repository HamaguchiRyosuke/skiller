class AccountMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_mailer.account_activation.subject
  #
  def account_activation(account)
    @account = account
    mail to: account.email, subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_mailer.password_reset.subject
  #
  def password_reset(account)
    @account = account
    mail to: account.email, subject: "Password reset"
  end
end
