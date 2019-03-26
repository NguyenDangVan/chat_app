class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_room
  before_action :set_todo_item, except: :create

  def create
    @todo_item = @todo_list.todo_items.create! todo_item_params

    if @todo_item.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @todo_item = @todo_list.todo_items.find params[:id]
    if @todo_item.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  def complete
    @todo_item.update_attributes completed_at: Time.now
  end

  private
  def set_room
    @room = Room.find params[:room_id]
  end

  def set_todo_list
    @todo_list = TodoList.find params[:todo_list_id]
  end

  def set_todo_item
    @todo_item = TodoItem.find params[:id]
  end

  def todo_item_params
    params.require(:todo_item).permit :content
  end
end
