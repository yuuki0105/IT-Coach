class Rooms::MessagesController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    if @message.save
      redirect_to room_path(id: @room.id)
    else
      @messages = @room.messages
      render "rooms/show"
    end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, room_id: @room.id)
  end

end
