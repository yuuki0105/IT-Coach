class RoomsController < ApplicationController

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
    @other_side_user = @room.other_side_user(current_user)
    have_unread = @room.messages.have_unread(@other_side_user.id)
    have_unread.update(read: true)
  end

  def index
    @rooms = Room.relative(current_user)
  end

end
