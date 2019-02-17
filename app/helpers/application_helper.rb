module ApplicationHelper
  #include Devise::Controllers::Helpers

  def mess_of_user message
    message.user_id == current_user.id
  end

  def gravatar_for user, opts = {}
    opt[:alt] = user.name
    image_tag "https://www.gravatar.com/avatar/#
      {Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}", opts
  end

end
