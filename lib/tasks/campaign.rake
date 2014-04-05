namespace :campaign do
  desc "TODO"
  task stop: :environment do

    campaigns = Campaign.where('closed_date is null')

    closable_campaigns = campaigns.select do |camp|
      (camp.created_at + camp.days.days < Date.today)
    end

    puts "\nFOUND #{closable_campaigns.length} campaigns whose date are due"

    closed_date = Date.today
    closable_campaigns.each do |camp|
      if( camp.collected >= camp.target )
        camp.fullfill_payment( closed_date )
        puts "\nPayment fullfilled for #{camp.title}"
      else
        camp.refund_payment(closed_date)
        puts "\nFunds refund for #{camp.title}"
      end
    end

  end

  desc "TODO"
  task my_task2: :environment do
    puts "task works"
  end

end
