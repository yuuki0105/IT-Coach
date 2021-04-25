class Registrations::CareersController < Registrations::BaseController
  def show
    @coach.careers.build if @coach.careers.blank?
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
