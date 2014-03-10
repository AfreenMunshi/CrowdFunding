class AddThumbsupToCampaigns < ActiveRecord::Migration
  def change
  	add_column :campaigns, :Thumbs_up, :integer, :default => 0
  end
end
