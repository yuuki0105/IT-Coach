class ResetPasswordsController < ApplicationController

def show
end

def create
  user = User.find_by(email: params[:email])
  verifier = ActiveSupport::MessageVerifier.new( Rails.application.credentials.secret_key_base, digest: 'SHA256')
  token = verifier.generate(user.email, expires_in: 1.day, purpose: :reset_password)
  user.update(reset_password_token: token, reset_password_sent_at: Time.current)
  User::Mailer.reset_password_email(user).deliver_now

  redirect_to reset_password_path, notice: 'メールを送信しました'

end

def update

end

end
