class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def new
    @relationship = current_user.relationships.new
    @message = Message.new
    @users = User.where.not(id: current_user.id)

    respond_to do |format|
      format.js
    end
  end

  def create
    @user_id = params[:relationship][:user_id]
    @relationship = current_user.relationships.find_by friend_id: params[:relationship][:friend_id]
    @status_request = params[:relationship][:status_request]
    if @relationship
      @user = User.find_by id: @relationship.friend_id
      @request = @relationship.update_attributes status_request: "Blocked"
    else
      if @status_request
        @user = User.find_by id: params[:relationship][:friend_id]
        @status = "Blocked"
      else
        @user = User.find_by id: params[:relationship][:friend_id]
        @status = "Pending"
      end
      @request = current_user.relationships.create! friend_id: @user.id, status_request: @status
    end

    if !@request
      redirect_to root_path
    end

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @relationship = Relationship.find_by(id: params[:id])
    @user = Relationship.find_by(id: params[:id]).friend

    current_user.un_friend @user

    respond_to do |format|
      format.js
    end
  end

  def update
  end

  def index
    @users = current_user.all_friends
    @q = User.search params[:q]
    @user = @q.result distinct: true
  end

  private

  def relationship_params
    params.require(:relationship).permit :friend_id, :user_id, :status_request
  end
end
