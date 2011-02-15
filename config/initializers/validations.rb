require 'nokogiri'

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag.starts_with?('<label')  
    aviso = Nokogiri::HTML.fragment("<span class='pequeno'> (#{instance.error_message.first})</span>")
  
    label = Nokogiri::HTML.fragment(html_tag).children.first
    label['class'] = "#{label['class']} erro"
    label.add_child(aviso)
    label.to_html.html_safe
  else
    html_tag
  end
end