class StaticPagesController < ApplicationController

  def home
    #@users = current_user.find_friend
    @users = User.all.where.not(id: current_user)
    #@conversations = Conversation.includes(:recipent, :sender)
  end

  def find_conversation sender_id, recipent_id
    return if Conversation.findy_by sender_id: sender_id, recipent_id: recipent_id
  end
end
