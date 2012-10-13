window.babyCasts = window.babyCasts or {}

window.babyCasts.main =
  init: ->
    babyCasts.main.clickToShowVideo()
    $('.disabled').tooltip()

  clickToShowVideo: ->
    $(".video-content img").click ->
      $(".video-content").animate({
        height: '126px'
      }, 500);
      $(this).parent().animate({
        height: '400px'
      }, 500);

$(document).ready ->
  babyCasts.main.init()