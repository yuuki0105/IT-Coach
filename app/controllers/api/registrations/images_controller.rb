class Api::Registrations::ImagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    @user = current_user
    if @user.update(user_params)
      render json: {}, status: :ok
    else
      render json: { error_messages: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:image)
  end
end
