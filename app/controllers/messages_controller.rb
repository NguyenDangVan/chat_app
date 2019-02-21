class MessagesController < ApplicationController
  def new
    @users = User.all
    @message = Message.new

    format_js
  end

  def create
    @message = current_user.messages.create message_params

    format_js
  end

  def show
    @user = User.find_by id: params[:user_id]
    @messages = Message.between(current_user.id, @user.id)
    @message = Message.new

    format_js
  end

  def index
    @mess_from_users = current_user.message_private
  end

  private

  def message_params
    params.require(:message).permit :content, :user_id, :recipient_id
  end

  def format_js
    respond_to do |format|
      format.js
    end
  end
end
