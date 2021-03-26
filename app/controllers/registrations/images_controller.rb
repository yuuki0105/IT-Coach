class Registrations::ImagesController < Registrations::BaseController

  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to registrations_profile_path
    else
      render :show
    end

  end

  private
  def user_params
    params.require(:user).permit(:image)
  end

end
