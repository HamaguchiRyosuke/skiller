class AccountActivationsController < ApplicationController

  def edit
    account = Account.find_by(email: params[:email])
    if account && account.deactivated? && account.authenticated?(:activation, params[:id])
      update_attributes(activated: true, activated_at: Time.zone.now)
      log_in account
      flash[:success] = "Account activated!"
      redirect_to account
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

end
