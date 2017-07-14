class AccountActivationsController < ApplicationController

  def edit
    account = Account.find_by(email: params[:email])
    if account && !account.activated? && account.authenticated?(:activation, params[:id])
      account.update_attribute(:activated,    true)
      account.update_attribute(:activated_at, Time.zone.now)
      log_in account
      flash[:success] = "Account activated!"
      redirect_to account
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

end
