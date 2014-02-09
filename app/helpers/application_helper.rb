module ApplicationHelper
	def active_class(cont, action)
		return 'active' if params[:controller] == cont && params[:action] == action
	end

	def category_active_class(cat)
		if cat == 'all' && params[:category_id].nil?
			'active'
		elsif cat == 'category' && params[:category_id].present?
			'active'
		elsif params[:category_id].present? && cat == @categories.detect{|c| c.id == params[:category_id].to_i }.id
			'active'
		end
	end

	def date_display(date)
		date.strftime("%d-%m-%Y") if date
	end
end
