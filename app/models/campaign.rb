class Campaign < ActiveRecord::Base
  belongs_to :user #association User.first.campaigns, campaign.user
  belongs_to :category

  has_many :transactions

  acts_as_taggable # Alias for acts_as_taggable_on :tags

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
    size: { :in => 0..400.kilobytes }

  validates_attachment :video, presence: true,
    content_type: { :content_type => "video/mp4" },
    size: { :in => 0..10000.kilobytes }

  def add_details(bank_uri)
    merchant_uri    = self.user.find_or_create_customer_uri
    merchant        = Balanced::Customer.fetch(merchant_uri)

    bank            = Balanced::BankAccount.fetch(bank_uri)
    self.bank_uri   = bank_uri

    bank.associate_to_customer(merchant)

    order           = merchant.create_order(description: "#{self.name}")
    self.order_uri  = order.href
    self.save
  end

end