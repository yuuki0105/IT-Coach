# == Schema Information
#
# Table name: abilities
#
#  id         :bigint           not null, primary key
#  coach_id   :bigint           not null
#  content    :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_abilities_on_coach_id  (coach_id)
#
# Foreign Keys
#
#  fk_rails_...  (coach_id => coaches.id)
#
require "rails_helper"

RSpec.describe Ability, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
