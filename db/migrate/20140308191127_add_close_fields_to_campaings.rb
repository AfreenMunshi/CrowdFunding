class AddCloseFieldsToCampaings < ActiveRecord::Migration
  def change
  	add_column :campaigns, :closed_date, :date
  	add_column :campaigns, :closed_reason, :string
  end
end
