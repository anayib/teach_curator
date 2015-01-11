module LessonsHelper

  def embed(url)
      youtube_id = url.split("=").last
      content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end

  def thumbnailScrap(url)

      thumbnail = LinkThumbnailer.generate(url)
      image = thumbnail.images.first.src.to_s
      content_tag(:image, nil, src:image)
  end
end



