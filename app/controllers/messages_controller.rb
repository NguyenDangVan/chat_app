class MessagesController < ApplicationController
  def create
    @conversation = Conversation.includes(:recipent)
    @message = @conversation.messages.create message_params

    respond_to do |format|
      format.js
    end
  end

  private
  def message_parmas
    params.require(:message).permit :content, :user_id, :room_id
  end
end
