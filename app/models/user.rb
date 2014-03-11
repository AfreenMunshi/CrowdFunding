class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :campaigns
  has_many :transactions
acts_as_voter

  def find_or_create_customer_uri
  	self.customer_uri ||= Balanced::Customer.new(name: self.name).save.href
  	self.save
  	self.customer_uri
  end

end

