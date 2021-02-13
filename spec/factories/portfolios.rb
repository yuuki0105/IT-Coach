# == Schema Information
#
# Table name: portfolios
#
#  id         :bigint           not null, primary key
#  coach_id   :bigint           not null
#  title      :string(255)      not null
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_portfolios_on_coach_id  (coach_id)
#
# Foreign Keys
#
#  fk_rails_...  (coach_id => coaches.id)
#
FactoryBot.define do
  factory :portfolio do

  end
end
