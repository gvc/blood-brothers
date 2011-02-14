require 'nokogiri'

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance| 
  input = Nokogiri::HTML.fragment(html_tag).children.first
  input['class'] = "#{input['class']} erro"
  input.to_html.html_safe
end