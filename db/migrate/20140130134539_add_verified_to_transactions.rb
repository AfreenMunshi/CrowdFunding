class AddVerifiedToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :verified, :boolean, :default => false
  end
end
