class UserWantSkillsController < ApplicationController

  def new
    @user = current_user
    @website_skills = Skill.where(skill_category_id: 1)
    @e_commerce_skills = Skill.where(skill_category_id: 2)
  end

  def create
    skill_ids = user_want_skill_params[:want_skills].reject { |skill_id| skill_id.blank? }.map{ |skill_id| skill_id.to_i }
    user_want_skills = []
    skill_ids.each do |skill_id|
      user_want_skills << UserWantSkill.new(user_id: current_user.id, skill_id: skill_id)
    end
    UserWantSkill.import user_want_skills
  end

  private
  def user_want_skill_params
    params.require(:user).permit({want_skills: []})
  end

end
