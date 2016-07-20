module ApplicationHelper
	def nav_link(link_text, link_path)
	  class_name = current_page?(link_path) ? 'activeNav' : ''

	  content_tag(:p, :class => class_name) do
	    link_to link_text, link_path
	  end
	end
end
