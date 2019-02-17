class RelationshipsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @users = current_user.list_friends
  end
end
