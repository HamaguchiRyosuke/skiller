class AccountActivationsController < ApplicationController

  def edit
    account = Account.find_by(email: params[:email])
    if account && account.deactivated? && account.authenticated?(:activation, params[:id])
      account.activate
      log_in account

      flash[:success] = "Account activated!"
      redirect_to new_user_path
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

end
