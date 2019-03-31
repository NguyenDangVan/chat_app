class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :cookie_set

  private

  def logged_in_user
    return if logged_in?
    redirect_to login_path
  end

  def correct_user
    return if @user || current_user
  end

  def get_ip
    request.remote_addr
  end

  def cookie_set
    @user = current_user
    return unless current_user
    cookies[:user_name] = @user.id
  end

end
