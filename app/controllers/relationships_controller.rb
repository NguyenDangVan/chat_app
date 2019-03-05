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
    @out_goings = current_user.pendings.page(params[:page]).per 4
    if params[:user_id]
      @user_id = params[:user_id]
      @relationship.destroy
      flash[:danger] = "Delete successfully"
    else
      @user = Relationship.find_by(id: params[:relationship][:friend_id]).friend
      current_user.un_friend @user
      flash[:danger] = "Delete friend successfully"
    end

    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def update
    @pending = Relationship.find_by id: params[:id]
    if @pending.update_attributes status_request: 1
      flash[:success] = "Accept successfully"
    else
      flash[:danger] = "Accept failed"
    end
    redirect_to user_relationships_path(current_user.id)
  end

  def index
    @users = current_user.list_friends_of_current_user
    @out_goings = current_user.pendings.page(params[:page]).per 4
    @q = User.search params[:q]
    @user = @q.result distinct: true
  end

  private

  def relationship_params
    params.require(:relationship).permit :friend_id, :user_id, :status_request
  end
end
