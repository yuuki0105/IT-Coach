class Registrations::YenPerHoursController < Registrations::BaseController
  before_action :set_yen_per_hour

  def show
  end

  def update
     @yen_per_hour.attributes = yen_per_hour_params
    if @yen_per_hour.save
      redirect_to registrations_careers_path
    else
      render :show
    end

  end

  private
  def yen_per_hour_params
    params.require(:yen_per_hour).permit(:price).merge(coach_id: current_user.coach.id)
  end

  def set_yen_per_hour
    if current_user.coach.yen_per_hour
      @yen_per_hour = current_user.coach.yen_per_hour
    else
      @yen_per_hour = YenPerHour.new(coach: current_user.coach)
    end
  end
end
