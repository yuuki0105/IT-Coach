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
require 'rails_helper'

RSpec.describe SkillCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
