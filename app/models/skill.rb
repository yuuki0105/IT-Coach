# == Schema Information
#
# Table name: skills
#
#  id                    :bigint           not null, primary key
#  skill_category_id     :bigint           not null
#  name(スキル名)        :string(255)      not null
#  en_name(英語スキル名) :string(255)      not null
#  published(公開非公開) :boolean          default(TRUE), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_skills_on_skill_category_id  (skill_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (skill_category_id => skill_categories.id)
#
class Skill < ApplicationRecord
  belongs_to :skill_category
  has_many :user_skills, dependent: :destroy
  has_many :users, through: :user_skills

  validates :name, presence: true
  validates :published, inclusion: { in: [true, false] }

  def to_param
    en_name
  end

end
