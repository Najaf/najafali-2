module NotesHelper
  def markdown_renderer
    Redcarpet::Render::HTML.new({ with_toc_data: true })
  end

  def markdown
    Redcarpet::Markdown.new(markdown_renderer,
      {fenced_code_blocks: true}
    )
  end

  def toc_renderer
    Redcarpet::Markdown.new(
      Redcarpet::Render::HTML_TOC
    )
  end

  def show_contents?
    word_count > 1000 && table_of_contents.strip.present?
  end

  def rendered_body
    markdown.render(@note.body).html_safe
  end

  def word_count
    rendered_body.split(' ').count
  end

  def table_of_contents
    toc_renderer.render(@note.body).html_safe
  end

  def publish_date
    @note.publish_date.strftime("%B %Y")
  end

  def cdata(content)
    ('<![CDATA[ ' + content + ' ]]>').html_safe
  end
end
