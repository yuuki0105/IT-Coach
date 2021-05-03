class UserWant::SkillsController < ApplicationController
  include AuthenticateUser

  def new
    @user = current_user
    @skill_categories = []
    SkillCategory.all.each do |skill_category|
      @skill_categories << { title: skill_category.name, skills: Skill.where(skill_category_id: skill_category.id) }
    end
  end

  def create
    skill_ids = user_want_skill_params[:want_skills].reject { |skill_id| skill_id.blank? }.map{ |skill_id| skill_id.to_i }
    user_want_skills = []
    ActiveRecord::Base.transaction do
      skill_ids.each do |skill_id|
        user_want_skills << UserWantSkill.new(user_id: current_user.id, skill_id: skill_id)
      end
      UserWantSkill.import user_want_skills
    end
    redirect_to new_user_want_ability_path
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  private

  def user_want_skill_params
    params.require(:user).permit({ want_skills: [] })
  end
end
