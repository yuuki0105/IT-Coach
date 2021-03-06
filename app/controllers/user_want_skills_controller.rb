class UserWantSkillsController < ApplicationController

  def new
    @user = current_user
    @skills = Skill.all
  end

  def create
  end

  private
  def user_want_skill_params
    params.require(:user).permit(:user_want_skills)
  end

end
