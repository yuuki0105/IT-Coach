namespace :batch do
  # bundle exec rake batch:update_to_before_examination
  desc "不合格者を90日後に審査前ステータスに戻す"

  task update_to_before_examination: :environment do
    target_date = Date.today - 90.days
    coaches = Coach.failed.where("examination_result_date <= ?", target_date)
    ActiveRecord::Base.transaction do
      coaches.update(examination_status_id: ExaminationStatus::BEFORE_EXAMINATION.id,examination_result_date: nil)
    end
  end

end