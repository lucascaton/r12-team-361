window.babyCasts = window.babyCasts or {}

window.babyCasts.main =
  init: ->
    obj = babyCasts.main;
    obj.clickToShowVideo()
    obj.hoverToShare()
    obj.clickToCloseVideo()
    obj.limitChar(".videoTitle", "35");
    obj.limitChar(".videoDescription", "140");

    $('.disabled').tooltip()
    ($ "a[data-toggle=modal]").click ->
      target = ($ @).attr('data-target')
      url = ($ @).attr('href')
      ($ target).load(url)

    $(".video-content").hover ->
      $(".video-content").css("opacity", "0.5")
      $(this).css("opacity", "1.0")
    , ->
      $(".video-content").css("opacity", "1.0")

    $(".share a").click (event) ->
      width = 575
      height = 400
      left = ($(window).width() - width) / 2
      top = ($(window).height() - height) / 2
      url = @href
      opts = "status=1" + ",width=" + width + ",height=" + height + ",top=" + top + ",left=" + left
      window.open url, "", opts
      return false


  limitChar: (element, limit) ->
    characterlimit = limit
    $(element).after("<sup></sup>").next().hide().end().keypress (e) ->
      current = $(this).val().length
      e.preventDefault()  if e.which isnt 0 and e.which isnt 8  if current >= characterlimit
      $(this).next().show().text characterlimit - current


  hoverToShare: ->
    $(".popover-click, .popover").hover ->
      $(@).parent().find(".popover").css("display", "block")
    , ->
      $(@).parent().find(".popover").css("display", "none")

  clickToShowVideo: ->
    $(".link-to-play").click ->
      videoId = $(@).parent().data("video_id").slice(0, -2)
      currentId = $(@).parent().data("video_id")
      $(".link-to-play").hide();
      $(@).parent().find(".close-video").show()
      $(@).parent().animate({
        height: '630px'
      }, 500, ->
        $("##{currentId}").html(
          "<iframe class='iframe' width='845' height='450' src='http://www.youtube.com/embed/#{videoId}?autoplay=1' frameborder='0' allowfullscreen></iframe>"
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