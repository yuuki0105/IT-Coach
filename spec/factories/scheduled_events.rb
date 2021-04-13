# == Schema Information
#
# Table name: scheduled_events
#
#  id                       :bigint           not null, primary key
#  coach_id                 :bigint           not null
#  google_calendar_id       :bigint           not null
#  google_calendar_event_id :string(255)      not null
#  start_time               :datetime         not null
#  end_time                 :datetime         not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
# Indexes
#
#  google_calendar_event_id_index                (google_calendar_event_id,google_calendar_id) UNIQUE
#  index_scheduled_events_on_coach_id            (coach_id)
#  index_scheduled_events_on_google_calendar_id  (google_calendar_id)
#
# Foreign Keys
#
#  fk_rails_...  (coach_id => coaches.id)
#  fk_rails_...  (google_calendar_id => google_calendars.id)
#
FactoryBot.define do
  factory :scheduled_event do
    
  end
end
