class Transaction < ActiveRecord::Base
	belongs_to :user
	belongs_to :campaign

	has_one_time_password

	
end
