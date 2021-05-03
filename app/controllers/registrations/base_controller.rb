class Registrations::BaseController < ApplicationController
  include AuthenticateUser
  before_action :set_coach
  before_action :require_before_examination

  private

  def set_coach
    @coach = Coach.find_or_create_by(user: current_user)
    @registration_complete_rate = @coach.registration_complete_rate
  end

  def require_before_examination
    unless @coach.before_examination?
      redirect_to mypage_path, notice: "既にコーチ審査は完了しています"
    end
  end
end
