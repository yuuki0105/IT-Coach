class ResetPasswordsController < ApplicationController
  def show
  end

  def create
    user = User.find_by(email: params[:email])
    token = SecureRandom.urlsafe_base64(40)
    user.update(reset_password_token: token, reset_password_sent_at: Time.current)
    User::Mailer.reset_password_email(user).deliver_now
    redirect_to reset_password_path, notice: "メールを送信しました"
  end

  def edit
    @user =User.find_by(reset_password_token: params[:token])
    unless @user&.reset_password_period_valid?
      redirect_to reset_password_path, alert: "失敗しました"
    end
  end

  def update
    @user = User.find_by(reset_password_token: user_params[:reset_password_token])
    redirect_to reset_password_path, alert: "失敗しました" unless @user&.reset_password_period_valid?
    @user.reset_password(user_params[:password], user_params[:password_confirmation])
    redirect_to new_user_session_path, notice: "パスワードを更新しました"
  end

  private

  def user_params
    params.require(:user).permit(:reset_password_token, :password, :password_confirmation)
  end
end
