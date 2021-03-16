class Registrations::CareersController < ApplicationController

  include AuthenticateUser

  def show
    @coach = Coach.find_or_create_by(user: current_user)
  end

  def update
    @coach = current_user.coach
    @coach.attributes = career_params
    @coach.careers = @coach.careers.select{ |a| a.valid? }
    if @coach.save
      redirect_to registrations_portfolios_path
    else
      render :new
    end
  end

  private
  def career_params
    params.require(:coach).permit(careers_attributes: [:id, :organization, :role, :start_month, :end_month, :ongoing, :_destroy])
  end

end
