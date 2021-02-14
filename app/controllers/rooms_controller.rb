class RoomsController < ApplicationController

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
  end

  def index
    @rooms = Room.relative(current_user)
  end

end
