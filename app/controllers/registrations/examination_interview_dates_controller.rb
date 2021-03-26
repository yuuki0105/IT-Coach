class Registrations::ExaminationInterviewDatesController < Registrations::BaseController

  before_action :arleady_examination_interview_date_confirmed
  protect_from_forgery except: [:update]

  def show
    @coach = Coach.find_or_create_by(user: current_user)
  end

  def update
    current_user.coach.update(examination_interview_date_confirmed: true)
  end

  private
  def arleady_examination_interview_date_confirmed
    if current_user.coach.examination_interview_date_confirmed
      redirect_to mypage_path, notice: "既に審査日程は確定しています"
    end
    unless current_user.coach.registration_complete_without_interview_date?
      redirect_to registrations_image_path, notice: "必須項目の入力が完了しておりません"
    end
  end

end
