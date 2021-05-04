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
#  index_rooms_on_other_user_id              (other_user_id)
#  index_rooms_on_user_id                    (user_id)
#  index_rooms_on_user_id_and_other_user_id  (user_id,other_user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (other_user_id => users.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Room, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
