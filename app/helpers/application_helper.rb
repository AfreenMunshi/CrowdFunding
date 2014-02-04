module ApplicationHelper
	def active_class(cont, action)
		return 'active' if params[:controller] == cont && params[:action] == action
	end

	def date_display(date)
		date.strftime("%d-%m-%Y") if date
	end
end
