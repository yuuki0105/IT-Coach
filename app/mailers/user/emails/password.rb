module User::Emails::Password

  extend ActiveSupport::Concern

  def password_reset_email(user)
    @user = user
    mail(to: @user.email,subject: '【パスワード変更】IT Coach')
  end

end
