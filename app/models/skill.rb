# == Schema Information
#
# Table name: skills
#
#  id                    :bigint           not null, primary key
#  name(スキル名)        :string(255)      not null
#  published(公開非公開) :boolean          default(TRUE), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  skill_category_id     :bigint           not null
#
# Indexes
#
#  index_skills_on_skill_category_id  (skill_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (skill_category_id => skill_categories.id)
#
class Skill < ApplicationRecord
  belongs_to :skill_category
end
