class UserWantSkillsController < ApplicationController

  def new
    @user = current_user
    @skills = Skill.all
  end

  def create
  end

end
