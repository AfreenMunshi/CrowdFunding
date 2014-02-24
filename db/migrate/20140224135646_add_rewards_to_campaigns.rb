class AddRewardsToCampaigns < ActiveRecord::Migration
  def change
  	add_column :campaigns, :first_reward, :string
  	add_column :campaigns, :highest_reward, :string
  end
end
