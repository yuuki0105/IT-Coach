class RoomsController < ApplicationController

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
  end

end
