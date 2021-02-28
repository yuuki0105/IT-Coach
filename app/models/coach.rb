# == Schema Information
#
# Table name: coaches
#
#  id                                  :bigint           not null, primary key
#  user_id                             :bigint           not null
#  schedule_confirmed                  :boolean          default(FALSE), not null
#  examination_status_id               :integer          default(1), not null
#  examination_result_date(審査結果日) :date
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
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
  belongs_to :examination_status
  belongs_to :user
  has_many :plans, dependent: :destroy
  has_many :careers, dependent: :destroy
  has_many :portfolios, dependent: :destroy
  has_one :yen_per_hour, dependent: :destroy

  validates :schedule_confirmed, inclusion: { in: [true, false] }
  validates :examination_status_id, presence: true, inclusion: { in: ExaminationStatus.pluck(:id) }

  def self.search(keyword)

    return Coach.all if keyword.blank?

    skills = Skill.where('name LIKE ?', "%#{keyword}%").pluck(:id)
    users = User.joins(:coach).eager_load(:user_skills).where('name LIKE ? OR profile LIKE ? OR user_skills.id in (?)', "%#{keyword}%","%#{keyword}%",skills.join(",")).distinct.pluck(:id)

    eager_load(:careers,:portfolios).where('careers.organization LIKE ? OR careers.role LIKE ? OR portfolios.title LIKE ? OR user_id in (?)', "%#{keyword}%","%#{keyword}%","%#{keyword}%" ,users.join(","))

  end

end
