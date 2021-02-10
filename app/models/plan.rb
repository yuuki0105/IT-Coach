# == Schema Information
#
# Table name: plans
#
#  id                     :bigint           not null, primary key
#  content                :text(65535)      not null
#  deleted                :boolean          default(FALSE), not null
#  fee                    :integer          not null
#  published              :boolean          default(TRUE), not null
#  target                 :string(255)      not null
#  title                  :string(255)      not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  coach_id               :bigint           not null
#  communication_style_id :integer          not null
#  term_id                :integer          not null
#
# Indexes
#
#  index_plans_on_coach_id  (coach_id)
#
# Foreign Keys
#
#  fk_rails_...  (coach_id => coaches.id)
#
class Plan < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :coach
  belongs_to :term
  belongs_to :communication_style

  validates :title, presence: true, length: { maximum: 80 }
  validates :term_id, presence: true, inclusion: { in: Term.pluck(:id) }
  validates :communication_style_id, presence: true, inclusion: { in: CommunicationStyle.pluck(:id) }
  validates :fee, presence: true, numericality: { greater_than_or_equal_to: 3000,less_than_or_equal_to: 9999999}
  validates :target, presence: true, length: { maximum: 200 }
  validates :content, presence: true, length: { maximum: 600 }
  validates :published, inclusion: { in: [true, false] }
  validates :deleted, inclusion: { in: [true, false] }

end
