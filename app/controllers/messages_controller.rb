class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new(messaage_params)
    @message.chatroom = @chatroom
    @message.user = current_user

    if @message.save
      redirect_to chatroom_path(@chatroom)
    else
      render 'chatrooms/show'
    end
  end
  
  private

  def message_params
    params.require(:message).permit(:content)
  end
end
