
messages = $('#message')

App.room = App.cable.subscriptions.create {
	channel: "RoomChannel",
	room_id: messages.data('room-id')
	},
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    messages.prepend data['message']

  speak: (message, room_id)->
    @perform 'speak', message: message, room_id: room_id


$('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_body')
      if $.trim(textarea.val()).length > 1
        App.global_chat.speak textarea.val(), messages.data('room-id')
        textarea.val('')
      e.preventDefault()
      return false