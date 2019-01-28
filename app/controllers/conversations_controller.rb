class ConversationsController < ApplicationController
  def create
    @conversation = Conversation.get current_user.id, params[:user_id]
    @messages = @conversation.messages
    respond_to do |format|
      format.js
    end
  end
end
