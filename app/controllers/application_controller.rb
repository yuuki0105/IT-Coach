class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:profile])# 編集時(account_update時)にname,profileというキーのパラメーターの更新を許可する
    end

    # ログイン後のリダイレクト先
    def after_sign_in_path_for(resource)
      user_path(resource.id)
    end

end