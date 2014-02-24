class RemoveStartDateFromCampaigns < ActiveRecord::Migration
  def change
    remove_column :campaigns, :start_date, :date
  end
end
