class StaticPagesController < ApplicationController
  before_action :logged_in_user

  def home
    @users = User.all.where.not(id: current_user)
  end
end
