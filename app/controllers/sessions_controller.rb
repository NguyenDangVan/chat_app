class SessionsController < Devise::SessionsController
  def new
    get_pre_login_url
    super
  end

  def create
    @referer_url = users_path
    super
  end

  private

  def get_pre_login_url
    @referer_url = users_path
  end
end
