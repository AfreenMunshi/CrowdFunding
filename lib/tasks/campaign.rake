namespace :campaign do
  desc "TODO"
  task stop: :environment do
    #assujming this works
    # assuming we have field, closed_date and closed_reason fields
    campaigns = Campaign.where('closed_date is null')

    closable_campaigns = campaigns.select do |camp|
      (camp.created_at + camp.days.days > Date.today - 1.day)
    end

    puts "\nFOUND #{closable_campaigns.length} campaigns whose date are due"

    closed_date = Date.today
    closable_campaigns.each do |camp|
      if( camp.collected >= camp.target )
        camp.fullfill_payment( closed_date )
        puts "\nPayment fullfilled for #{camp.title}"
      else
        puts "\nYet to decide on refund for #{camp.title}"
        #refund the money??
        camp.update_attributes(closed_date: closed_date, closed_reason: 'failed')
        next
      end
    end

  end

  desc "TODO"
  task my_task2: :environment do
    puts "task works"
  end

end
