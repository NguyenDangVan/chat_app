class StaticPagesController < ApplicationController
  before_action :logged_in_user

  def home
    @users = User.all.where.not(id: current_user)
    # friend of current_user
  end

  def find_conversation sender_id, recipent_id
    return if Conversation.findy_by sender_id: sender_id, recipent_id: recipent_id
  end
end
