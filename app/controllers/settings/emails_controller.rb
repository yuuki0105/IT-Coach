class Settings::EmailsController < ApplicationController
  include AuthenticateUser

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to setting_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
