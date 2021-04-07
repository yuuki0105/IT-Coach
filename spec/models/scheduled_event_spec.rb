# == Schema Information
#
# Table name: scheduled_events
#
#  id                       :bigint           not null, primary key
#  coach_id                 :bigint           not null
#  google_calender_event_id :string(255)      not null
#  start_time               :datetime         not null
#  end_time                 :datetime         not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
# Indexes
#
#  index_scheduled_events_on_coach_id  (coach_id)
#
# Foreign Keys
#
#  fk_rails_...  (coach_id => coaches.id)
#
require 'rails_helper'

RSpec.describe ScheduledEvent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
