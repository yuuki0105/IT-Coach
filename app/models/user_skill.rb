# == Schema Information
#
# Table name: user_skills
#
#  id              :bigint           not null, primary key
#  user_id         :bigint           not null
#  skill_id        :bigint           not null
#  experience_year :integer          default(0), not null
#  level           :integer          default(1), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_user_skills_on_skill_id  (skill_id)
#  index_user_skills_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (skill_id => skills.id)
#  fk_rails_...  (user_id => users.id)
#
class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  validates :skill_id, uniqueness: { scope: [:user_id] }
  validates :experience_year, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 30}
  validates :level, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

end
