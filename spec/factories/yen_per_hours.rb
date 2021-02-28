# == Schema Information
#
# Table name: yen_per_hours
#
#  id         :bigint           not null, primary key
#  coach_id   :bigint           not null
#  price      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_yen_per_hours_on_coach_id  (coach_id)
#
# Foreign Keys
#
#  fk_rails_...  (coach_id => coaches.id)
#
FactoryBot.define do
  factory :yen_per_hour do

  end
end
