class Searches::SkillCategories::SkillsController < ApplicationController

  def index
    @skill_category = SkillCategory.find_by(en_name: params[:skill_category_en_name])
    @skills = @skill_category.skills
  end

  def show
    @skill_category = SkillCategory.find_by(en_name: params[:skill_category_en_name])
    @skill = @skill_category.skills.find_by(en_name: params[:en_name])
  end

end
