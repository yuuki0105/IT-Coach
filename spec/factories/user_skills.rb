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
#  index_user_skills_on_skill_id              (skill_id)
#  index_user_skills_on_skill_id_and_user_id  (skill_id,user_id) UNIQUE
#  index_user_skills_on_user_id               (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (skill_id => skills.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :user_skill do
    experience_year { 1 }
    level { 1 }
    user { nil }
    skill { nil }
  end
end
