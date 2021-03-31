class ImagesController < ApplicationController

  include AuthenticateUser

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(image_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  private
  def image_params
    params.require(:user).permit(:image)
  end

end
