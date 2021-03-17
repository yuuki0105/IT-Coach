class Registrations::AbilitiesController < ApplicationController

  include AuthenticateUser

  def show
    @coach = Coach.find_or_create_by(user: current_user)
    @coach.abilities.build if @coach.abilities.blank?
  end

  def update
    @coach = current_user.coach
    @coach.attributes = ability_params
    @coach.abilities = @coach.abilities.select{ |a| a.valid? }
    if @coach.save
      redirect_to registrations_yen_per_hours_path
    else
      render :new
    end
  end

  private
  def ability_params
    params.require(:coach).permit(abilities_attributes: [:id, :content, :_destroy])
  end

end
