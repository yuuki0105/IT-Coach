class Mypages::ProfilesController < ApplicationController
  include AuthenticateUser

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(profile_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:profile)
  end
end
