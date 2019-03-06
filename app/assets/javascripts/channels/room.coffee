App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
  # Called when the subscription is ready for use on the server

  disconnected: ->
  # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages_private').append data['message']
    scroll_bottom()

  speak: (message, recipient_id, group_id, sender_id) ->
    @perform 'speak', message: message, recipient_id: recipient_id, group_id: group_id, sender_id: sender_id


$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13
    recipient_id = $('#messages_private').data('recipient_id')
    sender_id = $('#messages_private').data('sender_id')
    App.room.speak event.target.value, recipient_id, '', sender_id
    event.target.value = ''
    event.preventDefault()

$(document).on 'keypress', '[data-behavior~=group_speaker]', (event) ->
  if event.keyCode is 13
    group_id = $('#messages_private').data('group')
    sender_id = $('#messages_private').data('sender_id')
    App.room.speak event.target.value, '', group_id, sender_id
    event.target.value = ''
    event.preventDefault()

scroll_bottom = () ->
  $('#messages_private').scrollTop($('#messages_private').prop("scrollHeight"))
