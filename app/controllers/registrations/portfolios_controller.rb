class Registrations::PortfoliosController < Registrations::BaseController
  def show
    @coach.portfolios.build if @coach.portfolios.blank?
  end

  def update
    @coach = current_user.coach
    @coach.attributes = portfolio_params
    @coach.portfolios = @coach.portfolios.select(&:valid?)
    if @coach.save
      redirect_to registrations_schedules_path
    else
      render :new
    end
  end

  private

  def portfolio_params
    params.require(:coach).permit(portfolios_attributes: [:id, :title, :url, :_destroy])
  end
end
