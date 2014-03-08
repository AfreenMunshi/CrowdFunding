class AddOrderFields < ActiveRecord::Migration
  def change
  	add_column :campaigns, :order_uri, :string
  	add_column :campaigns, :bank_uri, :string
  	add_column :users, :customer_uri, :string

  	rename_column :transactions, :balanced_account_uri, :card_uri

  	remove_column :users, :wepay_account_id, :string
  	remove_column :users, :wepay_access_token, :string
  	remove_column :users, :balanced_account_uri, :string
  end
end
