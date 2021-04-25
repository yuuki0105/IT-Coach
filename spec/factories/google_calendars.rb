# == Schema Information
#
# Table name: google_calendars
#
#  id                                                                      :bigint           not null, primary key
#  coach_id                                                                :bigint           not null
#  calendar_id                                                             :string(255)      not null
#  next_sync_token(googleカレンダーの更新された情報を最新化するために使う) :string(255)      default(""), not null
#  created_at                                                              :datetime         not null
#  updated_at                                                              :datetime         not null
#
# Indexes
#
#  index_google_calendars_on_coach_id  (coach_id)
#
# Foreign Keys
#
#  fk_rails_...  (coach_id => coaches.id)
#
FactoryBot.define do
  factory :google_calendar do
  end
end
