module ApplicationHelper

  class PygmentsHTML < Redcarpet::Render::HTML
    def block_code code, language
      Pygments.highlight(code, :lexer => language)
    end
  end
  
  def markdown(text)
    # 生成渲染器renderer，支持页面内的锚点anchor，当原始文档有新行时自动换行
    renderer = PygmentsHTML.new(
      with_toc_data: true,
      hard_wrap: true
    )
    # 扩展markdown标记语言功能
    options = {
      :no_intra_emphasis => true,
      :tables => true,
      :fenced_code_blocks => true,
      :autolink => true,
      :strikethrough => true,
      :lax_spacing => true,
      :superscript => true
    }
    markdown = Redcarpet::Markdown.new(renderer, options)
    markdown.render(text).html_safe
  end

end
