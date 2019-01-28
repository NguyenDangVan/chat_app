class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: %i(home)

  def home
    @users = User.select_by
    @conversations = Conversation.includes(:recipent, :sender)
  end
end
