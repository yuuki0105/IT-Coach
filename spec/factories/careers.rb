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
FactoryBot.define do
  factory :career do
    
  end
end
