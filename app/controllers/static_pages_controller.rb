class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: %i(home)

  def home
    @users = User.select_by
  end
end
