module ApplicationHelper
	def flasherize(key)
		case key.to_sym
		when :error
			"error"
		when :success
			"success"
		else
			"info"
		end
	end
end
