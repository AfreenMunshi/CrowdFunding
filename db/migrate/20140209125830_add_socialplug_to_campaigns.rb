class AddSocialplugToCampaigns < ActiveRecord::Migration
  def change
  		add_column :campaigns, :socialplug, :string
  end
end
