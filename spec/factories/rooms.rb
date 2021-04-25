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
FactoryBot.define do
  factory :room do
  end
end
