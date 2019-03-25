class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:edit, :update, :destroy]
  before_action :set_room

  def show
    @todo_list = TodoList.find params[:id]
  end

  def index
    @todo_lists = TodoList.all

    format_js
  end

  def new
    @user_room = UserRoom.find_by user_id: current_user.id, room_id: 2
    @todo_list = TodoList.new

    format_js
  end

  def create
    @todo_lists = TodoList.all
    @todo_list = TodoList.create! todo_list_params
    if @todo_list.save
      format_js
    end
  end

  def edit
    @user_room = UserRoom.find_by user_id: current_user.id, room_id: 2
    format_js
  end

  def update
    @todo_lists = TodoList.all
    @todo_list.update todo_list_params

    format_js
  end

  def destroy
    @todo_lists = TodoList.all

    if @todo_list.destroy
      format_js
    end
  end

  private
  def format_js
    respond_to do |format|
      format.js
    end
  end

  def set_todo_list
    @todo_list = TodoList.find params[:id]
  end

  def set_room
    @room = Room.find params[:room_id]
  end

  def todo_list_params
    params.require(:todo_list).permit :title, :description, :user_room_id, :room_id
  end
end
