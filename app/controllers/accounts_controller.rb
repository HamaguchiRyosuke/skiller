class AccountsController < ApplicationController

  def new
    @account = Account.new
  end

  def create
    @account = SendActivationEmailDecorator.new(Account.new(account_params))
    if @account.save
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    Account.find(params[:id]).destroy
    flash[:success] = "Success delete account!"
    redirect_to root_url
  end


  private
  def account_params
    params.require(:account).permit(:email, :password, :password_confirmation)
  end
end
