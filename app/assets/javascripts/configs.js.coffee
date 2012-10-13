window.BabyCasts = window.BabyCasts or {}

window.BabyCasts.main =
  init: ->
    $('.disabled').tooltip()

$(document).ready ->
  BabyCasts.main.init()