# == Schema Information
#
# Table name: user_want_abilities
#
#  id                      :bigint           not null, primary key
#  user_id                 :bigint           not null
#  technology_degree_id    :integer          not null
#  communication_degree_id :integer          not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_user_want_abilities_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class UserWantAbility < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :technology_degree
  belongs_to :communication_degree

  validates :technology_degree_id, presence: true, inclusion: { in: TechnologyDegree.pluck(:id) }
  validates :communication_degree_id, presence: true, inclusion: { in: CommunicationDegree.pluck(:id) }
end
