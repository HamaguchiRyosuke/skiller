class UsersController < ApplicationController
  before_action :logged_in_account, only: [:index, :show, :new, :create,  :edit, :update]
  before_action :correct_account,   only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
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
    # @user.skills.create
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

  # beforeアクション

  def user_params
    params.require(:user).permit( :name,
                                  :gender,
                                  :age,
                                  :other_information,
                                  :skill_ids => []
                                  # skills_attributes: [:id, :skill_title]
                                  )
  end
  # addresses_attributes: [:id, :zipcode, :city, :street, :tel, :_destroy]

  # 正しいユーザーかどうかを確認
  def correct_account
    @account = Account.find(params[:id])
    flash.now[:danger] = "Not your account" unless current_account?(@account)
    redirect_to user_path(id: current_account.id) unless current_account?(@account)
  end
end
