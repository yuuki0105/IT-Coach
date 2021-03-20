class User::Mailer < ApplicationMailer

  default from: 'info@it_coach.com'

  include User::Emails::Password

end