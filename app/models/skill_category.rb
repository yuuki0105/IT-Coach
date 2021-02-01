# == Schema Information
#
# Table name: skill_categories
#
#  id         :bigint           not null, primary key
#  en_name    :string(255)      not null
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SkillCategory < ApplicationRecord
  has_many :skills, dependent: :destroy
end