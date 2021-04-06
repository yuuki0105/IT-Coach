# == Schema Information
#
# Table name: google_calendar_tokens
#
#  id           :bigint           not null, primary key
#  coach_id     :bigint           not null
#  access_token :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_google_calendar_tokens_on_coach_id  (coach_id)
#
# Foreign Keys
#
#  fk_rails_...  (coach_id => coaches.id)
#
FactoryBot.define do
  factory :google_calendar_token do
    
  end
end
