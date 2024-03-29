# == Schema Information
#
# Table name: user_want_frees
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  content    :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_want_frees_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe UserWantFree, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
