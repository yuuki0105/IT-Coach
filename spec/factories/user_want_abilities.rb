# == Schema Information
#
# Table name: user_want_abilities
#
#  id               :bigint           not null, primary key
#  user_id          :bigint           not null
#  technology_id    :integer          not null
#  communication_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_user_want_abilities_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :user_want_ability do
    
  end
end
