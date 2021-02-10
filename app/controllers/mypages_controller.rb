class MypagesController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = current_user
    @coach = @user.coach
  end

  def edit
    @user = current_user
    @coach = @user.coach
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile, :image,  { user_skills_attributes: [:id, :skill_id, :experience_year, :level]})
  end

end
