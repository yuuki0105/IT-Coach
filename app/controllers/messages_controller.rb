class MessagesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @receive_messages = Message.where(send_user: @user,receive_user: current_user)
    @send_messages = Message.where(receive_user: @user,send_user: current_user)
    @message = Message.new
  end

  def create
    @user = User.find(params[:user_id])
    @message = Message.new(message_params)
    if @message.save
      redirect_to user_messages_path(user_id: @user.id)
    else
      flash[:error] = "エラーがおきました"
      redirect_to user_messages_path(user_id: @user.id)
    end
  end

    private
    def message_params
      params.require(:message).permit(:content).merge(send_user_id: current_user.id, receive_user_id: @user.id)
    end

end
