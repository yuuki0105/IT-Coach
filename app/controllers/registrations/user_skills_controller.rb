class Registrations::UserSkillsController < Registrations::BaseController

  def show
    @user = current_user
    @user.user_skills.build if @user.user_skills.blank?
  end

  def update
    @user = current_user
    @user.attributes = user_skill_params
    @user.user_skills = @user.user_skills.select{ |a| a.valid? }
    if @user.save
      redirect_to registrations_abilities_path
    else
      render :show
    end

  end

  private
  def user_skill_params
    params.require(:user).permit(user_skills_attributes: [:id, :skill_id, :experience_year, :level, :_destroy])
  end


end
