class MessagesController < ApplicationController
  # def create
  #   @conversation = Conversation.includes(:recipent).find(params[:conversation_id])
  #   @message = @conversation.messages.create message_params

  #   respond_to do |format|
  #     format.js
  #   end
  # end

  # def show
  #   # fix cung hien thi mess voi user_id: 2
  #   @conversation = Conversation.find_by sender_id: current_user.id
  #   @messages = @conversation.messages
  # end

  # private

  # def message_params
  #   params.require(:message).permit :content, :user_id, :conversation_id, :room_id
  # end

end
