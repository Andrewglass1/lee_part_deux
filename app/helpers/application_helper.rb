module ApplicationHelper

	def add_current_class(name)
		" current" if controller.controller_name == name
	end

end