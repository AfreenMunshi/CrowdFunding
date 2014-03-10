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

  # searchable do
  #   text :name, :info
  # end

  def add_details(bank_uri)
    merchant_uri    = self.user.find_or_create_customer_uri
    merchant        = Balanced::Customer.fetch(merchant_uri)

    bank            = Balanced::BankAccount.fetch(bank_uri)
    self.bank_uri   = bank_uri

    bank.associate_to_customer(merchant)

    order           = merchant.create_order(description: "#{self.id} : #{self.name}")
    self.order_uri  = order.href
    self.save
  end

  def fullfill_payment(closed_date = Date.today) #take todays date if no parameter passed
    #ideally we should update before money is transferring so that new payment is not done meanwhile
    self.reload.update_attributes(closed_date: closed_date, closed_reason: 'success')

    order         = Balanced::Order.fetch self.order_uri
    bank_account  = Balanced::BankAccount.fetch self.bank_uri

    order.credit_to(
      destination: bank_account,
      amount: self.collected * 100 * 0.95 #transfer 95% money
      # amount: order.amount_escrowed * 0.95
    )
  end
end