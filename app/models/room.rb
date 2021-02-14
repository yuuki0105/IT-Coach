# == Schema Information
#
# Table name: rooms
#
#  id                                :bigint           not null, primary key
#  user_id                           :bigint           not null
#  other_user_id(もう一人のユーザー) :bigint           not null
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#
# Indexes
#
#  index_rooms_on_other_user_id  (other_user_id)
#  index_rooms_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (other_user_id => users.id)
#  fk_rails_...  (user_id => users.id)
#
class Room < ApplicationRecord
  belongs_to :user
  belongs_to :other_user, class_name: "User"
  has_many :messages, dependent: :destroy

  def other_side_user(me)
    self.user == me ? other_user : me
  end

  def self.relative(me)
    where(user: me).or(where(other_user: me))
  end
end
