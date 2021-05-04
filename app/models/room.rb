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

  validates :user_id, uniqueness: { scope: [:other_user_id] }
  validate :user_not_equal_other_user

  def other_side_user(other_user)
    user == other_user ? other_user : user
  end

  def self.relative(other_user)
    where(user: other_user).or(where(other_user: other_user))
  end

  private

  def user_not_equal_other_user
    return if user_id != other_user_id

    errors.add(:user_id, "同じユーザー同士でルームをつくることはできません")
  end
end
