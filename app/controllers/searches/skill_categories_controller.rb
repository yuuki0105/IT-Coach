class Searches::SkillCategoriesController < ApplicationController

  def index
    @skill_categories = SkillCategory.all
    @coaches = Coach.all
  end

end
