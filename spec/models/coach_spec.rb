# == Schema Information
#
# Table name: coaches
#
#  id                 :bigint           not null, primary key
#  examination_status :integer          default(0), not null
#  schedule_confirmed :boolean          default(FALSE), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_coaches_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Coach, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
