module UsersHelper
  def current_account?(account)
    account == current_account
  end

  # 記憶トークンcookieに対応するアカウントを返す
  def current_account
    if (account_id = session[:account_id])
      @current_account ||= Account.find_by(id: account_id)
    elsif (account_id = cookies.signed[:account_id])
      account = Account.find_by(id: account_id)
      if account && account.authenticated?(cookies[:remember_token])
        log_in account
        @current_account = account
      end
    end
  end
end
