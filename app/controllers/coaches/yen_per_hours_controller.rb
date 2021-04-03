class Coaches::YenPerHoursController < ApplicationController

  include AuthenticateUser

  def new
    @yen_per_hour = YenPerHour.new
  end

  def create
    @yen_per_hour = YenPerHour.new(yen_per_hour_params)
    if @yen_per_hour.save
      redirect_to mypage_path
    else
      render :new
    end
  end

  def edit
    @yen_per_hour = current_user.coach.yen_per_hour
  end

  def update
    @yen_per_hour = current_user.coach.yen_per_hour
    if @yen_per_hour.update(yen_per_hour_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  private
  def yen_per_hour_params
    params.require(:yen_per_hour).permit(:price).merge(coach_id: current_user.coach.id)
  end

end
