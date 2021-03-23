module User::Emails::Password

  extend ActiveSupport::Concern

  def reset_password_email(user)
    @user = user

    from = SendGrid::Email.new(email: 'komatsu@member.co.jp')
    to = SendGrid::Email.new(email: @user.email )
    subject = '【パスワード変更】IT Coach'
    content = SendGrid::Content.new(type: 'text/plain', value: mail.body.raw_source)
    mail = SendGrid::Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: Rails.application.credentials.sendgrid[:api_key])
    response = sg.client.mail._('send').post(request_body: mail.to_json)

  end

end
