class AddBdayToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :bday, :date
  	add_column :transactions, :country, :string
  	add_column :transactions, :state, :string
  	add_column :transactions, :ip, :string
  end
end
