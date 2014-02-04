class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :info
      t.integer :days
      t.integer :target
      t.date :start_date
      t.integer :user_id

      t.timestamps
    end
  end
end
