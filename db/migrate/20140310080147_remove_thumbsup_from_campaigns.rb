class RemoveThumbsupFromCampaigns < ActiveRecord::Migration
  def change
    remove_column :campaigns, :Thumbs_up, :integer
  end
end
