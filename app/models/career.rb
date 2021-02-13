# == Schema Information
#
# Table name: careers
#
#  id           :bigint           not null, primary key
#  coach_id     :bigint           not null
#  organization :string(255)      not null
#  role         :string(255)
#  start_month  :date             not null
#  end_month    :date
#  ongoing      :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_careers_on_coach_id  (coach_id)
#
# Foreign Keys
#
#  fk_rails_...  (coach_id => coaches.id)
#
class Career < ApplicationRecord
  belongs_to :coach

  validates :organization, presence: true, length: { maximum: 20 }
  validates :role, length: { maximum: 40 }
  validates :start_month, presence: true
  validates :ongoing, inclusion: { in: [true, false] }

end
