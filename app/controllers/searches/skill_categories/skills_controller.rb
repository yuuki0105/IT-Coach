class Searches::SkillCategories::SkillsController < ApplicationController
  def index
    @skill_category = SkillCategory.find_by(en_name: params[:skill_category_en_name])
    @skills = @skill_category.skills

    user_ids = User.eager_load(:user_skills).where(user_skills: {id: @skills.pluck(:id)}).pluck(:id)
    @coaches = Coach.where(user_id: user_ids)
  end

  def show
    @skill_category = SkillCategory.find_by(en_name: params[:skill_category_en_name])
    @skill = @skill_category.skills.find_by(en_name: params[:en_name])

    user_ids = @skill.users.pluck(:id)
    @coaches = Coach.where(user_id: user_ids)
  end
end
