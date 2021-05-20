class Registrations::ImagesController < Registrations::BaseController
  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:image)
  end
end
