class AddApprovedToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :approved, :boolean, :default => false
  end
end
