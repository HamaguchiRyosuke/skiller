class AccountsController < ApplicationController
  before_action :admin_account, only: :destroy

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    activation_decorator = ActivationAccountEmailDecorator.new(@account)
    if activation_decorator.save
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    Account.find_by(params[:id]).destroy
    flash[:success] = "Success delete account!"
    redirect_to root_url
  end


  private
  def account_params
    params.require(:account).permit(:email, :password, :password_confirmation)
  end

  # beforeアクション

  # 管理者かどうか確認
  def admin_account
    redirect_to(root_url) unless current_account.admin?
  end
end
