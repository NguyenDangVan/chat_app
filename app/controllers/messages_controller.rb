class MessagesController < ApplicationController
  before_action :logged_in_user

  def new
    @users = User.all
    @message = Message.new

    format_js
  end

  def create
    if params[:mess_for_users]
      params[:mess_for_users].each {
        |a| Message.create content: params[:message][:content],
          user_id: current_user.id,
          recipient_id: a}
      redirect_to user_messages_path(current_user.id)
    else
      @message = current_user.messages.create message_params
    end

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
