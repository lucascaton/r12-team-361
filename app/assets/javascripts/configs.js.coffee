window.babyCasts = window.babyCasts or {}

window.babyCasts.main =
  init: ->
    obj = babyCasts.main;
    obj.clickToShowVideo()
    obj.hoverToShare()
    obj.clickToCloseVideo()

    $('.disabled').tooltip()
    $('.btn-upload').click ->
      $(@).modal()

  hoverToShare: ->
    $(".popover-click, .popover").hover ->
      $(@).parent().find(".popover").css("display", "block")
    , ->
      $(@).parent().find(".popover").css("display", "none")

  clickToShowVideo: ->
    $(".link-to-play").click ->
      videoId = $(@).parent().data("video_id")
      $(".link-to-play").hide();
      $(@).parent().find(".close-video").show()
      $(@).parent().animate({
        height: '590px'
      }, 500, ->
        $("##{videoId}").html(
          "<iframe class='iframe' width='695' height='415' src='http://www.youtube.com/embed/#{videoId}?autoplay=1' frameborder='0' allowfullscreen></iframe>"
        )
      )

  clickToCloseVideo: ->
    $(".close-video").click ->
      $(".link-to-play").show()
      $('.iframe').remove()
      $('.video-content').animate({
        height: '126px'
      }, 500)
      $(@).hide()



$(document).ready ->
  babyCasts.main.init()