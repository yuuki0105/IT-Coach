# == Schema Information
#
# Table name: plans
#
#  id                     :bigint           not null, primary key
#  content                :string(255)      not null
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
class Plan < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :coach
  belongs_to :term
  belongs_to :communication_style
end