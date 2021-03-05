# == Schema Information
#
# Table name: user_want_skills
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  skill_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_want_skills_on_skill_id  (skill_id)
#  index_user_want_skills_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (skill_id => skills.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :user_want_skill do
    
  end
end
