# == Schema Information
#
# Table name: messages
#
#  id                            :bigint           not null, primary key
#  send_user_id(送信ユーザー)    :bigint           not null
#  receive_user_id(受信ユーザー) :bigint           not null
#  content                       :text(65535)      not null
#  read(既読/未読)               :boolean          default(FALSE), not null
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
# Indexes
#
#  index_messages_on_receive_user_id  (receive_user_id)
#  index_messages_on_send_user_id     (send_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (receive_user_id => users.id)
#  fk_rails_...  (send_user_id => users.id)
#
class Message < ApplicationRecord
  belongs_to :send_user,class_name: "User"
  belongs_to :receive_user,class_name: "User"
end
