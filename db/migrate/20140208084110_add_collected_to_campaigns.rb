class AddCollectedToCampaigns < ActiveRecord::Migration
  def change
  	add_column :campaigns, :collected, :integer, :default => 0
  	add_column :campaigns, :category, :string
  end
end
