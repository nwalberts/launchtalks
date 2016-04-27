module ApplicationHelper
  def embed(youtube_url)
   youtube_id = youtube_url.split("=").last
   content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end

  # def markdown(text)
  #   markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
  #   :autolink => true, :space_after_headers => true, :no_intra_emphasis => true)
  #   markdown.render(text).html_safe
  # end

  def markdown(text)
    render_options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow' }
      # no_images: true
    }
    renderer = Redcarpet::Render::HTML.new(render_options)

    extensions = {
      autolink: true,
      fenced_code_blocks: true,
      lax_spacing:        true,
      no_intra_emphasis:  true,
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end
end
