class Searches::UsersController < ApplicationController
  def index
    @users = User.ransack(name_cont: params[:search]).result
  end
end
