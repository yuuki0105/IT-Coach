class ExaminationInterviewDatesController < ApplicationController

  include AuthenticateUser
  before_action :arleady_examination_interview_date_confirmed
  protect_from_forgery except: [:update]

  def show
  end

  def update
    current_user.coach.update(examination_interview_date_confirmed: true)
  end

  private
  def arleady_examination_interview_date_confirmed
    if current_user.coach.examination_interview_date_confirmed
      redirect_to mypage_path
    end
  end
end