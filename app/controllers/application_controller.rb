class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:password_create_myself]) # 新規登録時(sign_up時)にname,password_create_myselfというキーのパラメーターを追加で許可する
    end

    # ログイン後のリダイレクト先
    def after_sign_in_path_for(resource)
      mypage_path
    end

end