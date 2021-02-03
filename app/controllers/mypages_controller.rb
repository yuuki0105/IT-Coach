class MypagesController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_mypage_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile, :image,  { user_skills_attributes: [:id, :skill_id, :experience_year, :level]})
  end

end
