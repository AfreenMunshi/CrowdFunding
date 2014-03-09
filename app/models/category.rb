class Category < ActiveRecord::Base
	has_many :campaigns

	def to_s
		self.name
	end
end
