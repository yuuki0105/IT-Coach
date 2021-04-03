class Mypages::NamesController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(name_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  private
  def name_params
    params.require(:user).permit(:name)
  end

end
