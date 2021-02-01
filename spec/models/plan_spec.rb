# == Schema Information
#
# Table name: plans
#
#  id                  :bigint           not null, primary key
#  coach_id            :bigint           not null
#  communication_style :integer          not null
#  content             :string(255)      not null
#  deleted             :boolean          default(FALSE), not null
#  fee                 :integer          not null
#  published           :boolean          default(TRUE), not null
#  target              :string(255)      not null
#  term                :integer          not null
#  title               :string(255)      not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
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
