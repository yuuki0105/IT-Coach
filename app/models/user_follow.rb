# == Schema Information
#
# Table name: user_follows
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  follow_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_follows_on_follow_id  (follow_id)
#  index_user_follows_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (follow_id => users.id)
#  fk_rails_...  (user_id => users.id)
#
class UserFollow < ApplicationRecord
  belongs_to :user
  belongs_to :follower, class_name: "User", foreign_key: "follow_id"

  validates :user_id, uniqueness: { scope: [:follower_id] }
end
