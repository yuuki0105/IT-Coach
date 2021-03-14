class Registrations::UserSkillsController < ApplicationController

  include AuthenticateUser

  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to registrations_abilities_path
    else
      render :show
    end

  end

  private
  def user_params
    params.require(:user).permit(user_skills_attributes: [:id, :skill_id, :experience_year, :level, :_destroy])
  end


end
