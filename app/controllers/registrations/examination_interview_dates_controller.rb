class Registrations::ExaminationInterviewDatesController < Registrations::BaseController
  before_action :arleady_examination_interview_date_confirmed
  protect_from_forgery except: [:update]

  def show; end

  def update
    @coach.update(examination_interview_date_confirmed: true)
  end

  private

  def arleady_examination_interview_date_confirmed
    return redirect_to mypage_path, notice: "既に審査日程は確定しています" if @coach.examination_interview_date_confirmed

    return if unless @coach.registration_complete_without_interview_date?
    return redirect_to registrations_image_path, notice: "必須項目の入力が完了しておりません"
  end
end
