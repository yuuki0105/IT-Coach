# == Schema Information
#
# Table name: careers
#
#  id           :bigint           not null, primary key
#  end_month    :date
#  ongoing      :boolean          default(FALSE), not null
#  organization :string(255)      not null
#  role         :string(255)
#  start_month  :date             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  coach_id     :bigint           not null
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
end
