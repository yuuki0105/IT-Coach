class Users::RoomsController < ApplicationController

  def create
    @room = Room.create(user_id: current_user.id, other_user_id: params[:user_id])
    redirect_to room_path(id: @room.id)
  end

end
