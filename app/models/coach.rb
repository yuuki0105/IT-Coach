# == Schema Information
#
# Table name: coaches
#
#  id                                                       :bigint           not null, primary key
#  user_id                                                  :bigint           not null
#  examination_interview_date_confirmed(審査面談日程の確定) :boolean          default(FALSE), not null
#  examination_status_id                                    :integer          default(1), not null
#  examination_result_date(審査結果日)                      :date
#  created_at                                               :datetime         not null
#  updated_at                                               :datetime         not null
#
# Indexes
#
#  index_coaches_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Coach < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  include Coach::GoogleCalendarClient

  # Relations
  belongs_to :examination_status
  belongs_to :user
  has_many :careers, dependent: :destroy
  has_many :portfolios, dependent: :destroy
  has_many :abilities, dependent: :destroy
  has_many :scheduled_events, dependent: :destroy
  has_one :yen_per_hour, dependent: :destroy
  has_one :google_calendar_token, dependent: :destroy
  has_one :google_calendar, dependent: :destroy

  accepts_nested_attributes_for :abilities, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :careers, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :portfolios, allow_destroy: true, reject_if: :all_blank

  # Validations
  validates :examination_interview_date_confirmed, inclusion: { in: [true, false] }
  validates :examination_status_id, presence: true, inclusion: { in: ExaminationStatus.pluck(:id) }

  # Callbacks

  # Delegates
  delegate :refresh_token, to: :google_calendar_token, allow_nil: true

  # Scopes
  scope :before_examinations, lambda {
    where(examination_status_id: ExaminationStatus::BEFORE_EXAMINATION.id)
  }

  scope :failed, lambda {
    where(examination_status_id: ExaminationStatus::FAILED.id)
  }

  scope :passed, lambda {
    where(examination_status_id: ExaminationStatus::PASSED.id)
  }

  # Methods
  def self.search(keyword)

    return Coach.all if keyword.blank?

    skills = Skill.where("name LIKE ?", "%#{keyword}%").pluck(:id)
    users = User.joins(:coach).eager_load(:user_skills).where("name LIKE ? OR profile LIKE ? OR user_skills.id in (?)", "%#{keyword}%", "%#{keyword}%", skills.join(",")).distinct.pluck(:id)

    eager_load(:careers, :portfolios, :abilities).where("careers.organization LIKE ? OR careers.role LIKE ? OR portfolios.title LIKE ? OR abilities.content LIKE ? OR user_id in (?)", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%" , users.join(","))

  end

  def registration_complete?
    return false unless registration_complete_without_interview_date?
    return false unless examination_interview_date_confirmed
    true
  end

  def registration_complete_without_interview_date?
    return false if user.image.blank?
    return false if user.profile.blank?
    return false if user.user_skills.blank?
    return false if abilities.blank?
    return false if yen_per_hour.blank?
    return false if careers.blank?
    return false if portfolios.blank?
    true
  end

  def registration_complete_or_after_examination?
    return true if passed?
    return true if failed?
    return true if registration_complete?
    false
  end

  def before_examination?
    examination_status_id == ExaminationStatus::BEFORE_EXAMINATION.id
  end

  def passed?
    examination_status_id == ExaminationStatus::PASSED.id
  end

  def failed?
    examination_status_id == ExaminationStatus::FAILED.id
  end

  def registration_complete_rate

    complete_array = []

    complete_array << user.image.present?
    complete_array << user.profile.present?
    complete_array << user.user_skills.present?
    complete_array << abilities.present?
    complete_array << yen_per_hour.present?
    complete_array << careers.present?
    complete_array << portfolios.present?
    complete_array << examination_interview_date_confirmed
    float_rate = (complete_array.select{ |n| n }.size.to_f / complete_array.size.to_f) * 100
    float_rate.round

  end
end
