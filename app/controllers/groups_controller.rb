class GroupsController < ApplicationController
  #before_action :load_group, except: [:create, :new]

  def index
    @user = User.find_by id: params[:user_id]
    @groups = @user.groups
  end

  def new
    @group = Group.new
    format_js
  end

  def create
    @group = Group.new group_params
    if @group.save
      Room.create user_id: params[:admin_group].to_i, group_id: @group.id
    else
      root_path
    end
    format_js
  end

  private

  def group_params
    params.require(:group).permit :title, :description, :admin_group
  end

  def format_js
    respond_to do |format|
      format.js
    end
  end
end
