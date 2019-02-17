class MessagesController < ApplicationController

  def create
    @message = current_user.messages.build message_params
    @message.user_id = current_user.id
    @message.recipient_id = params[:user_id]


    # MessageBroadcastob.perform_later(@message)

    # respond_to do |format|
    #   format.js
    # end
  end

  def show
    @user = User.find_by id: params[:user_id]
    @messages = Message.between(current_user.id, @user.id)
    @message = Message.new

    respond_to do |format|
      format.js
    end
  end

  def index
    @mess_from_users = current_user.message_private
  end

  private

  def message_params
    params.require(:message).permit :content
  end
end
