class ConversationsController < ApplicationController
  def create
    @conversation = Conversation.get current_user.id, params[:user_id]

    respond_to do |format|
      format.js
    end
  end
end
