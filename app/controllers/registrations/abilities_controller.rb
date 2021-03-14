class Registrations::AbilitiesController < ApplicationController

  include AuthenticateUser

  def show
    @coach = Coach.find_or_create_by(user: current_user)
  end

  def update
    @coach = current_user.coach
    @coach.attributes = ability_params
    @coach.abilities = @coach.abilities.select{ |a| a.valid? }
    if @coach.save
      redirect_to mypage_path
    else
      render :new
    end
  end

  private
  def ability_params
    params.require(:coach).permit(abilities_attributes: [:id, :content, :_destroy])
  end

end
