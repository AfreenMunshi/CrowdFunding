class RemoveCategoriesFromCampaigns < ActiveRecord::Migration
  def change
  	remove_column :campaigns, :category, :string
  	add_column :campaigns, :category_id, :integer
  end
end
