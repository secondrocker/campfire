# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    
  disconnected: ->
    
  received: (data)->
    $("#messages").append data['message']
  speak: (message)->
    @perform 'speak',message:message      

$(document).on 'keypress','[data-behavior~=room_speaker]', (event)->
  if event.keyCode is 13
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()