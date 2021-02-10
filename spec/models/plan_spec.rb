# == Schema Information
#
# Table name: plans
#
#  id                     :bigint           not null, primary key
#  content                :text(65535)      not null
#  deleted                :boolean          default(FALSE), not null
#  fee                    :integer          not null
#  published              :boolean          default(TRUE), not null
#  target                 :string(255)      not null
#  title                  :string(255)      not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  coach_id               :bigint           not null
#  communication_style_id :integer          not null
#  term_id                :integer          not null
#
# Indexes
#
#  index_plans_on_coach_id  (coach_id)
#
# Foreign Keys
#
#  fk_rails_...  (coach_id => coaches.id)
#
require 'rails_helper'

RSpec.describe Plan, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
