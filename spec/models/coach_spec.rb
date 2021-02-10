# == Schema Information
#
# Table name: coaches
#
#  id                                  :bigint           not null, primary key
#  examination_result_date(審査結果日) :date
#  schedule_confirmed                  :boolean          default(FALSE), not null
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#  examination_status_id               :integer          default(1), not null
#  user_id                             :bigint           not null
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
