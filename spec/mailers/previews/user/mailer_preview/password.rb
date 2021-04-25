# Preview all emails at http://localhost:3000/rails/mailers/user/reset_password

class User::MailerPreview
  module Password
  extend ActiveSupport::Concern
    included do
      def reset_password_email
        @user = User.find_by(id: params[:id]) || User.last
        User::Mailer.reset_password_email(@user)
      end
    end

  end
end
