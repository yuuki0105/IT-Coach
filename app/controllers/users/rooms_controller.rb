class Users::RoomsController < ApplicationController
  def create
    @room = Room.find_or_initialize_by(user_id: current_user.id, other_user_id: params[:user_id])

    if @room.save
      redirect_to room_path(id: @room.id)
    else
      flash[:error] = @room.errors.full_messages.join(",")
      coach = User.find(params[:user_id]).coach
      redirect_to coach_path(id: coach.id)
    end

  end
end
