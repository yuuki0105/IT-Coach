# == Schema Information
#
# Table name: plans
#
#  id                     :bigint           not null, primary key
#  coach_id               :bigint           not null
#  title                  :string(255)      not null
#  term_id                :integer          not null
#  communication_style_id :integer          not null
#  fee                    :integer          not null
#  target                 :string(255)      not null
#  content                :text(65535)      not null
#  published              :boolean          default(TRUE), not null
#  deleted                :boolean          default(FALSE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_plans_on_coach_id  (coach_id)
#
# Foreign Keys
#
#  fk_rails_...  (coach_id => coaches.id)
#
FactoryBot.define do
  factory :plan do

  end
end
