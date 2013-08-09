module ApplicationHelper
  def source_dive(&blk)
    content_tag :div, class: 'protip source_dive' do
      content_tag(:h3, 'Source Diving') +
      content_tag(:div, class: 'protip-content', &blk)
    end
  end

  def snippet(name, lexer = :ruby)
    path = Rails.root + 'snippets' + name
    data = File.read path
    highlit = Pygments.highlight data, lexer: lexer
    Haml::Helpers.preserve(highlit)
  end
end
