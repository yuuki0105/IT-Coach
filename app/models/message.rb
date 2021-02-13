# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  user_id         :bigint           not null
#  coach_id        :bigint           not null
#  message         :text(65535)      not null
#  read(既読/未読) :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_messages_on_coach_id  (coach_id)
#  index_messages_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (coach_id => coaches.id)
#  fk_rails_...  (user_id => users.id)
#
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :coach
end
