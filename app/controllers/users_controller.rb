class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = @account.user(user_params)
  end

  def edit
    @user = @account.user(user_params)
  end

  def user_params
    params.require(:user).permit(:name, :gender, :age, :teach_skill, :learn_skill, :other_information)
  end
end
