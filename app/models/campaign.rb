class Campaign < ActiveRecord::Base
	belongs_to :user #association User.first.campaigns, campaign.user
	belongs_to :category
	
	has_many :transactions
	has_attached_file :banner #papeclip
	has_attached_file :video #papeclip

 	validates :title, presence: true
  validates :info, presence: true
  validates :days, presence: true
  validates :target, presence: true
  validates :days, numericality: { only_integer: true }
  validates :target, numericality: true

	validates_attachment :banner, presence: true,
	  content_type: { :content_type => ["image/jpg", 'image/png', 'image/jpeg'] },
	  size: { :in => 0..100.kilobytes }

  validates_attachment :video, presence: true,
	  content_type: { :content_type => "video/mp4" },
	  size: { :in => 0..6000.kilobytes }

end