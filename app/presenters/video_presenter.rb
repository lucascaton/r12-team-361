class VideoPresenter < Presenter
  def sponsored_mark
    content_tag(:span, "sponsored") if sponsored?
  end

  def presentation
    if sponsored?
      "video-content span9 sponsored"
    else
      "video-content span9"
    end
  end
end
