module ApplicationHelper
	def title
		base_title = "Ruby on Rails Tutorial Sample App"
		if !@title.nil?
		#	base_title += " | "@title
			base_title = "#{base_title} | #{@title}"
		end
		base_title
	end
end
