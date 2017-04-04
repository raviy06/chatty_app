
jQuery(document).on 'turbolinks:load', ->

App.room = App.cable.subscriptions.create {
	channel: "RoomChannel",
	room_id: $('#messages').data('room-id')
	},
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append data['message']

  speak: (message, room_id)->
    @perform 'speak', message: message, room_id: room_id

$(document).on 'keypress', '[data-behaviour~=room_speaker]', (event) ->
  if event.keyCode is 13 

        App.room.speak event.target.value
        event.target.value = ''
        event.preventDefault()
      