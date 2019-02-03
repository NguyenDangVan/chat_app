class ConversationsController < ApplicationController
  def index
    @users = User.find_friend
    @conversations = Conversation.includes(:recipent, :sender)
  end

  def create
    @conversation = Conversation.get current_user.id, params[:user_id]
    @messages = @conversation.messages
    @user = User.find_by id: params[:user_id]
    respond_to do |format|
      format.js
    end
  end
end