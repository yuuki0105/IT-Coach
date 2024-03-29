# == Schema Information
#
# Table name: sns_accounts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  provider   :string(255)      not null
#  uid        :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sns_accounts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class SnsAccount < ApplicationRecord
  belongs_to :user, optional: true
  validates :provider, presence: true
  validates :uid, presence: true
end
