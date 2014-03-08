class Transaction < ActiveRecord::Base
	belongs_to :user
	belongs_to :campaign

	has_one_time_password


	#get the money to escrow account.

	def mark_verifed_and_debit
    card  = Balanced::Card.fetch self.card_uri
    order = Balanced::Order.fetch self.campaign.order_uri
    order.debit_from(
      source: card,
      amount: self.amount * 100
    )

    self.update_attributes(verified: true)
    campaign = self.campaign
    #place to implement row level database locking
    campaign.update_attributes(collected: campaign.collected + self.amount)
	end

end
