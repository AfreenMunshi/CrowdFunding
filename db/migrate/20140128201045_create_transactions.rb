class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :campaign_id

      t.timestamps
    end
  end
end
