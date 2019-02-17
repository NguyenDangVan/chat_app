module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
    # if user_id = session[:user_id]
    #   @current_user ||= User.find_by id: user_id
    # elsif user_id = cookies.signed[:user_id]
    #   user = User.find_by id: user_id
    #   if user && user.authenticated?(:remember, cookies[:remember_token])
    #     log_in user
    #     @current_user = user
    #   end
    # else
    #   @current_user
    # end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
