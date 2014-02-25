namespace :campaign do
  desc "TODO"
  task stop: :environment do
  	#assujming this works
  	# assuming we have field, closed_date and closed_reason fields
  	campaigns = Campaign.where('closed_date is null')

  	closable_campaigns = campaigns.select do |camp|
  		(camp.created_at + camp.days.days > Date.today)
  	end

  	closed_date = Date.today
  	closable_campaigns.each do |camp|
  		if( camp.target < camp.collected )
  			camp.update_attributes(closed_date: closed_date, closed_reason: 'failed')
  			next
  		end

  		camp.transactions.where(verified: true).each do |tran|
  			bak_account_uri = tran.user.balanced_account_uri
  			#credit amount from escrw acc to the users bank.
  		end
  		camp.update_attributes(closed_date: closed_date, closed_reason: 'success')
  	end

  end

  desc "TODO"
  task my_task2: :environment do
  	puts "task works"
  end

end
