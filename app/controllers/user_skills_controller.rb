class UserSkillsController < ApplicationController
  def new
    @user_skill = UserSkill.new
  end

  def create
    @user_skill = UserSkill.new(user_skill_params)
    if @user_skill.save
      redirect_to edit_mypage_path
    else
      render :new
    end
  end

  def edit
    @user_skill = current_user.user_skills.find(params[:id])
  end

  def update
    @user_skill = current_user.user_skills.find(params[:id])
    if @user_skill.update(user_skill_params)
      redirect_to edit_mypage_path
    else
      render :edit
    end
  end



  def destroy
    @user_skill = current_user.user_skills.find(params[:id])
    if @user_skill.destroy
      redirect_to edit_mypage_path
    else
      flash[:error] = "削除に失敗しました"
      redirect_to edit_mypage_path
    end
  end

  private
  def user_skill_params
    params.require(:user_skill).permit(:skill_id, :experience_year, :level).merge(user_id: current_user.id)
  end

end
