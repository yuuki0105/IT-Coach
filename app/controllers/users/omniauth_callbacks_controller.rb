class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @omniauth = request.env['omniauth.auth']
      if @omniauth.present?
        @profile = SnsAccount.find_by(provider: @omniauth['provider'], uid: @omniauth['uid'])
      unless @profile
        @profile = SnsAccount.new(provider: @omniauth['provider'], uid: @omniauth['uid'])
        @profile.user = current_user || User.create!(name: @omniauth['info']['name'], email: @omniauth['info']['email'], password: Devise.friendly_token)
        @profile.save!
      end

      #ログインしていたら
      if current_user
        #ユーザーが一致しない場合エラーをあげる
        raise "user is not identical" if current_user != @profile.user
      #ログインしていなかったら
      else
        sign_in(:user, @profile.user)
      end
    end
    redirect_to user_path(@profile.user)
  end

  def failure
    redirect_to root_path
  end
end