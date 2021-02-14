# == Schema Information
#
# Table name: skill_categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  en_name    :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SkillCategory < ApplicationRecord
  has_many :skills, dependent: :destroy

  validates :name, presence: true
  validates :en_name, presence: true
end
