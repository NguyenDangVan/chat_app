class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform message
    ActionCable.server.broadcast "room_channel",
      message: render_message(message)
  end

  private

  def render_message message
    # view = ActionView::Base.new(ActionController::Base.view_paths, {})
    # view.class_eval do
    #   # include any needed helpers (for the view)
    #   include ApplicationHelper
    #   #include Devise
    # end
    # byebug
    # view.render partial: 'messages/message', locals: {message: message}
    # MessagesController.render partial: 'messages/message', locals: {message: message}
    # renderer = ApplicationController.renderer.new(method: 'get', https: true)
    #ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    MessagesController.render partial: 'messages/message_job', locals: {message: message}
  end
end
