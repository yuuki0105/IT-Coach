class Registrations::BaseController < ApplicationController

  include AuthenticateUser
  before_action :require_before_examination

  private
  def require_before_examination
    unless current_user.coach&.before_examination?
      redirect_to mypage_path, notice: "既にコーチ審査は完了しています"
    end
  end

end