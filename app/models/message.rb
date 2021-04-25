# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  room_id         :bigint           not null
#  user_id         :bigint           not null
#  content         :text(65535)      not null
#  read(既読/未読) :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_messages_on_room_id  (room_id)
#  index_messages_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (room_id => rooms.id)
#  fk_rails_...  (user_id => users.id)
#
class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_many :notifications

  validates :content, presence: true, length: { maximum: 1000 }
  validates :read, inclusion: { in: [true, false] }

  scope :have_unread, -> (user_id) do
    where(read: false, user_id: user_id)
  end
end
