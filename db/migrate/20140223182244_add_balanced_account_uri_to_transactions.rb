class AddBalancedAccountUriToTransactions < ActiveRecord::Migration
  def change
  	add_column :transactions, :balanced_account_uri, :string
  end
end
