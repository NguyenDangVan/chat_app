class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def new
    @relationship = Relationship.new
    @message = Message.new

    respond_to do |format|
      format.js
    end
  end

  def create
    if params[:relationship]
      @user = User.find_by id: params[:relationship][:friend_id]
      @status = "Pending"
    else
      @user = User.find_by id: params[:friend_id]
      @status = "Accepted"
    end
    @request = current_user.relationships.create! friend_id: @user.id, status_request: @status

    flash.now[:success] = "Send friend request successfully" if @request

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @user = Relationship.find_by(id: params[:id]).friend
    current_user.un_friend @user

    respond_to do |format|
      format.js
    end
  end

  def update
  end

  def index
    @users = current_user.list_friends
    @q = User.search params[:q]
    @user = @q.result distinct: true
  end

  private

  def relationship_params
    params.require(:relationship).permit :friend_id, :user_id, :status_request
  end
end
