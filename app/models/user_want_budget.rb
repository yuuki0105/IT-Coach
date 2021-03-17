# == Schema Information
#
# Table name: user_want_budgets
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  will         :string(255)      not null
#  budget       :integer          not null
#  yen_per_hour :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_user_want_budgets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class UserWantBudget < ApplicationRecord
  belongs_to :user
end
