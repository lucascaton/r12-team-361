window.babyCasts = window.babyCasts or {}

window.babyCasts.main =
  init: ->
    babyCasts.main.clickToShowVideo()
    babyCasts.main.hoverToShare()

    $('.disabled').tooltip()

  hoverToShare: ->
    $(".popover-click, .popover").hover ->
      $(@).parent().find(".popover").css("display", "block")
    , ->
      $(@).parent().find(".popover").css("display", "none")

  clickToShowVideo: ->
    $(".link-to-play").click ->
      $(@).addClass("video-actived")
      videoId = $(@).parent().data("video_id");
      $(@).parent().animate({
        height: '590px'
      }, 500, ->
        $("##{videoId}").html(
          "<iframe width='695' height='415' src='http://www.youtube.com/embed/#{videoId}' frameborder='0' allowfullscreen></iframe>"
        )
      );

$(document).ready ->
  babyCasts.main.init()