App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
  # Called when the subscription is ready for use on the server

  disconnected: ->
  # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages_private').append data['message']

  speak: (message, recipient_id) ->
    @perform 'speak', message: message, recipient_id: recipient_id

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13
    recipient_id = $('#messages_private').data('recipient_id')
    App.room.speak event.target.value, recipient_id
    event.target.value = ''
    event.preventDefault()
