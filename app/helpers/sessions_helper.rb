module SessionsHelper
  # 渡されたユーザーでのログイン
  def log_in(account)
    session[:account_id] = account.id
  end
  def current_account?(account)
    account == current_account
  end

  # 現在ログイン中のユーザーを返す
  def current_account
    @current_account ||= Account.find_by(id: session[:account_id])
  end

  def logged_in?
    !current_account.nil?
  end

  def log_out
    session.delete(:account_id)
    @current_account = nil
  end

  def deactivated?
    !account.activated?
  end
end
