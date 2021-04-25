class User::Mailer < ApplicationMailer

  default from: "komatsu@member.co.jp"

  include User::Emails::Password

end