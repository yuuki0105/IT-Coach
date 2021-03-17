class Registrations::PortfoliosController < ApplicationController

  include AuthenticateUser

  def show
    @coach = Coach.find_or_create_by(user: current_user)
    @coach.portfolios.build if @coach.portfolios.blank?
  end

  def update
    @coach = current_user.coach
    @coach.attributes = portfolio_params
    @coach.portfolios = @coach.portfolios.select{ |a| a.valid? }
    if @coach.save
      redirect_to registrations_examination_interview_date_path
    else
      render :new
    end
  end

  private
  def portfolio_params
    params.require(:coach).permit(portfolios_attributes: [:id, :title, :url, :_destroy])
  end

end
