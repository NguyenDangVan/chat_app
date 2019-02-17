module MessagesHelper
  def mess_of_user message
    message.user_id == current_user.id
  end
end
