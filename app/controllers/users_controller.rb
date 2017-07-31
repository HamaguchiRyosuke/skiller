class UsersController < ApplicationController
  before_action :logged_in_account, only: [:index, :show, :new, :create,  :edit, :update]
  before_action :correct_user,      only: [:edit, :update]

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
    @teach_skills = []
    @user.teach_skills.each do |teach_skill|
      s = Skill.find_by(id: teach_skill.skill_id)
      if s
        @teach_skills << s
      end
    end
    @learn_skills = []
    @user.learn_skills.each do |learn_skill|
      s = Skill.find_by(id: learn_skill.skill_id)
      if s
        @learn_skills << s
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @teach_skills = @user.teach_skills
    @learn_skills = @user.learn_skills
    @teach_skills.delete_all if @teach_skills
    @learn_skills.delete_all if @learn_skills
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
                                  { teach_skills_attributes: [:skill_id] },
                                  { learn_skills_attributes: [:skill_id] }
                                  )
  end

  def correct_user
    @user = User.find(params[:id])
    flash.now[:danger] = "Not your account" unless @user == current_account.user
    redirect_to user_path(id: @user.id) unless @user == current_account.user
  end
end
