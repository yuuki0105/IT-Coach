# Preview all emails at http://localhost:3000/rails/mailers/user/password_reset

class User::MailerPreview

  module Password
  extend ActiveSupport::Concern
    included do

      def password_reset_email
        @user = User.find_by(id: params[:id]) || User.last
        User::Mailer.password_reset_email(@user)
      end

    end

  end

end
