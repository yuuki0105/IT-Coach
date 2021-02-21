class Searches::SkillCategoriesController < ApplicationController

  def index
    @skill_categories = SkillCategory.all
  end

end
