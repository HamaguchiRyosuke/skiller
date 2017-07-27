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
    @user.update_attributes(user_params)
    binding.pry
    # if @user.update_attributes(user_params)
      # あとでリファクタリング
      # teach_skill_params[:ids].shift
      # teach_skill_params[:ids].each do |skill_id|
      #   @teach_skills = @user.teach_skills.find_or_create_by(skill_id: skill_id)
      # end

      # チェックボックスでチェックされていない項目のskill_idを削除して
      # プロフィール画面で表示しないようにしたい
      # (1..Skill.count).each do |skill_id|
      #   (1..teach_skill_params[:ids].size).each do |num|
      #     if @teach_skills[num] != skill_id
      #       @user.teach_skills.find_by(skill_id: skill_id).destroy
      #     end
      #   end
      # end

      # あとでリファクタリング
      # learn_skill_params[:ids].shift
      # learn_skill_params[:ids].each do |skill_id|
      #   @learn_skills = @user.learn_skills.find_or_create_by(skill_id: skill_id)
      # end

      # チェックボックスでチェックされていない項目のskill_idを削除して
      # プロフィール画面で表示しないようにしたい
      # (1..Skill.count).each do |skill_id|
      #   (1..learn_skill_params[:ids].size).each do |num|
      #     if @learn_skills[num] != skill_id
      #       @user.learn_skills.find_by(skill_id: skill_id).destroy
      #     end
      #   end
      # end

      flash[:success] = "Profile Updated"
      redirect_to @user
    # else
    #   render :edit
    # end
  end

  # def destroy
  #   @teach_skill = @user.teach_skills.find_or_create_by(skill_id: skill_id)
  #   @learn_skill = @user.learn_skills.find_or_create_by(skill_id: skill_id)
  #   learn_skill_params[:ids].each do |skill_id|
  #     @learn_skill = @user.learn_skills.find_or_create_by(skill_id: skill_id)
  #   end
  #
  # end


  # beforeアクション

  def user_params
    # params.require(:user).permit( :name,
    #                               :gender,
    #                               :age,
    #                               :other_information
    #                               )

    params.require(:user).permit( :name,
                                  :gender,
                                  :age,
                                  :other_information,
                                  { teach_skills_attributes: [:skill_id] },
                                  { learn_skills_attributes: [:skill_id] }
                                  )
  end

  def teach_skill_params
    params.require(:teach_skills).permit(:ids => [], :skill_ids => [])
  end

  def learn_skill_params
    params.require(:learn_skills).permit(:ids => [], :skill_ids => [])
  end

  # addresses_attributes: [:id, :zipcode, :city, :street, :tel, :_destroy]

  # 正しいユーザーかどうかを確認
  def correct_account
    @account = Account.find(params[:id])
    flash.now[:danger] = "Not your account" unless current_account?(@account)
    redirect_to user_path(id: current_account.id) unless current_account?(@account)
  end
end
