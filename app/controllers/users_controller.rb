class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create,  :edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create

    @user = current_account.build_user(user_params)
    if @user.save
      flash[:success] = "User created!"
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :gender, :age, :teach_skill, :learn_skill, :other_information)
  end
end
