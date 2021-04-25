# == Schema Information
#
# Table name: user_want_budgets
#
#  id                   :bigint           not null, primary key
#  user_id              :bigint           not null
#  will                 :string(255)      not null
#  want_budget_id       :integer          not null
#  want_yen_per_hour_id :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_user_want_budgets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :user_want_budget do

  end
end
