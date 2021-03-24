class ResetPasswordsController < ApplicationController

def show
end

def create
  user = User.find_by(email: params[:email])
  token = SecureRandom.urlsafe_base64(40)
  user.update(reset_password_token: token, reset_password_sent_at: Time.current)
  User::Mailer.reset_password_email(user).deliver_now

  redirect_to reset_password_path, notice: 'メールを送信しました'

end

def update

end

end
