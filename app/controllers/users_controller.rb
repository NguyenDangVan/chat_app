class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i(index)

  def index
    @users = User.select_by
  end
end
