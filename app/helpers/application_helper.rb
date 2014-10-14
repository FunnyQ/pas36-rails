module ApplicationHelper

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
      end)
    end
    nil
  end

  def index_slider_content_admin(slider)
    if slider.img?
      image_tag slider.img.url(:thumb)
    else
      youtube_embed(slider.link).html_safe
    end
  end

  def index_slider_content_front(slider)
    if slider.img?
      image_tag slider.img.url
    else
      youtube_embed_free(slider.link).html_safe
    end
  end

  def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end

    %Q{<iframe title="YouTube video player" width="200" height="89" src="http://www.youtube.com/embed/#{ youtube_id }?rel=0&amp;controls=0" frameborder="0" allowfullscreen></iframe>}
  end

  def youtube_embed_free(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end

    %Q{<iframe class="video-wrapper" title="YouTube video player" src="http://www.youtube.com/embed/#{ youtube_id }?rel=0&amp;controls=0" frameborder="0" allowfullscreen></iframe>}
  end

  def render_thumb(target)
    image_tag target.img.url(:thumb)
  end

  def render_banner_link(target)
    if target.link?
      target.link
    else
      "#"
    end
  end

end
