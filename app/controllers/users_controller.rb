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
    @skill_list = @user.skills.pluck(:skill_title).join(",")
  end

  def update
    @user = User.find(params[:id])
    skill_list = params[:skill_list].split(",")
    if @user.update_attributes(user_params)
      @user.save_skills(skill_list)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render :edit
    end


    # if @user.update_attributes(user_params)
    #   # あとでリファクタリング
    #   teach_skill_params[:teach_skill_ids].shift
    #   teach_skill_params[:teach_skill_ids].each do |skill_id|
    #     @user.teach_skills.build(skill_id: skill_id)
    #   end
    #   # あとでリファクタリング
    #   learn_skill_params[:learn_skill_ids].shift
    #   learn_skill_params[:learn_skill_ids].each do |skill_id|
    #     @user.learn_skills.build(skill_id: skill_id)
    #   end
  end


  # beforeアクション

  def user_params
    params.require(:user).permit( :name,
                                  :gender,
                                  :age,
                                  :other_information
                                  )
  end

  def teach_skill_params
    params.require(:teach_skills).permit(:teach_skill_ids => [])
  end

  def learn_skill_params
    params.require(:learn_skills).permit(:learn_skill_ids => [])
  end

  # addresses_attributes: [:id, :zipcode, :city, :street, :tel, :_destroy]

  # 正しいユーザーかどうかを確認
  def correct_account
    @account = Account.find(params[:id])
    flash.now[:danger] = "Not your account" unless current_account?(@account)
    redirect_to user_path(id: current_account.id) unless current_account?(@account)
  end
end
