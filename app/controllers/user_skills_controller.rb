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

  private
  def user_skill_params
    params.require(:user_skill).permit(:skill_id, :experience_year, :level).merge(user_id: current_user.id)
  end

end
