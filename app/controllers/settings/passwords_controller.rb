class Settings::PasswordsController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if user_params[:password].empty?
      flash[:error] = "パスワード更新に失敗しました"
      return render :edit
    end

    if @user.password_create_myself
      unless @user.valid_password?(current_user_params[:current_password])
        flash[:error] = "パスワード更新に失敗しました"
        return render :edit
      end
    end

    if @user.update(user_params)
      sign_in(@user, bypass: true) if current_user.id == @user.id
      redirect_to setting_path
    else
      flash[:error] = "パスワード更新に失敗しました"
      render :edit
    end
  end

  private

  def current_user_params
    params.require(:user).permit(:current_password)
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation).merge(password_create_myself: true)
  end
end
