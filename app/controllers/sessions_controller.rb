class SessionsController < ApplicationController
  def new
  end

  def create
    account = Account.find_by(email: params[:session][:email])
    if account && account.authenticate(params[:session][:password])
      if account.activated?
        log_in account
        params[:session][:remember_me] == '1' ? remember(account) : forget(account)
        redirect_to users_path
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
