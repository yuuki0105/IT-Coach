class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :basic_auth

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :password_create_myself]) # 新規登録時(sign_up時)にname,password_create_myselfというキーのパラメーターを追加で許可する
    end

    # ログイン後のリダイレクト先
    def after_sign_in_path_for(resource)
      if resource.is_a?(AdminUser)
        admin_root_path
      else
        mypage_path
      end
    end

    private

    def basic_auth
        return unless Rails.env.production?
        return unless request.path.start_with?("/admin")
        authenticate_or_request_with_http_basic do |id, password|
          id == Rails.application.credentials.basic_auth[:id] && password == Rails.application. credentials.basic_auth[:password]
        end
    end
end
