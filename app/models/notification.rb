# == Schema Information
#
# Table name: notifications
#
#  id                     :bigint           not null, primary key
#  user_id                :bigint           not null
#  message_id             :bigint
#  read(既読/未読)        :boolean          default(FALSE), not null
#  notification_type_id   :integer          not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_notifications_on_message_id  (message_id)
#  index_notifications_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (message_id => messages.id)
#  fk_rails_...  (user_id => users.id)
#
class Notification < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :message, optional: true
  belongs_to :notification_type

  validates :read, inclusion: { in: [true, false] }
  validates :notification_type_id, presence: true, inclusion: { in: NotificationType.all.pluck(:id) }

  scope :unread, lambda {
    where(read: false)
  }

  scope :type_is_messages, lambda {
    where(notification_type_id: NotificationType::MESSAGE.id)
  }

  def type_is_message?
    notification_type == NotificationType::MESSAGE
  end

  def message_send_user
    return unless message

    message.room.other_side_user(user)
  end
end
