class HomeController < ApplicationController

  def show
    @skill_categories = SkillCategory.all
  end

end
