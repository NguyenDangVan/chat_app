class TodoListsController < ApplicationController
  def show
    @todo_list = TodoList.find params[:id]
  end

  def index
    @todo_lists = TodoList.all
    respond_to do |format|
      format.js
    end
  end
end
