class AddBalancedAccountUriToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :balanced_account_uri, :string
  end
end
