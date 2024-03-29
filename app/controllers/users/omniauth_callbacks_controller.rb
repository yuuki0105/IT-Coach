class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  require "open-uri"

  def facebook
    sns_callback
  end

  def twitter
    sns_callback
  end

  def failure
    redirect_to root_path
  end

  private

  def sns_callback
    @omniauth = request.env["omniauth.auth"]
    @profile = SnsAccount.find_by(provider: @omniauth["provider"], uid: @omniauth["uid"])
    @profile ||= SnsAccount.new(provider: @omniauth["provider"], uid: @omniauth["uid"])
    user = current_user || User.find_by(email: @omniauth["info"]["email"]) || User.create!(name: @omniauth["info"]["name"], email: @omniauth["info"]["email"], password: Devise.friendly_token, password_create_myself: false)
    @profile.user = user
    unless @profile.user.image.attached?
      image = URI.parse(@omniauth["info"]["image"]).open
      @profile.user.image.attach(io: image, filename: "user.png")
    end
    @profile.save!
    if current_user
      # ユーザーが一致しない場合エラーをあげる
      raise "user is not identical" if current_user != @profile.user
    else
      sign_in(:user, @profile.user)
    end
    redirect_to user_path(@profile.user)
  end
end
