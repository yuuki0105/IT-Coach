# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  message         :text(65535)      not null
#  read(既読/未読) :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  coach_id        :bigint           not null
#  user_id         :bigint           not null
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
require 'rails_helper'

RSpec.describe Message, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
