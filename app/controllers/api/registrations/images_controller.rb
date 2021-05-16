class Api::Registrations::ImagesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def update
    @user = current_user
    if @user.update(user_params)
      # redirect_to registrations_profile_path
    else
      # render :show
    end
  end

  private
  def user_params
    params.require(:user).permit(:image)
  end

end