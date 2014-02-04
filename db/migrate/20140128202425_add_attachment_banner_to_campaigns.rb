class AddAttachmentBannerToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.attachment :banner
      t.attachment :video
    end
  end

  def self.down
    drop_attached_file :campaigns, :banner
    drop_attached_file :campaigns, :video
  end
end
