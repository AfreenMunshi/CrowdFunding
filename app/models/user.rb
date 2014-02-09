class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :campaigns
  has_many :transactions

# get the authorization url for this user. This url will let the user 
# register or login to WePay to approve our app.

# returns a url
def wepay_authorization_url(redirect_uri)
  CrowdFunding::Application::WEPAY.oauth2_authorize_url(redirect_uri, self.email, self.name)
end

# takes a code returned by wepay oauth2 authorization and makes an api call to generate oauth2 token for this user.
def request_wepay_access_token(code, redirect_uri)
  response = CrowdFunding::Application::WEPAY.oauth2_token(code, redirect_uri)
  if response['error']
    raise "Error - "+ response['error_description']
  elsif !response['access_token']
    raise "Error requesting access from WePay"
  else
    self.wepay_access_token = response['access_token']
    self.save

	#create WePay account
    self.create_wepay_account
  end
end


def has_wepay_account?
  self.wepay_account_id != 0 && !self.wepay_account_id.nil?
end

# creates a WePay account for this user with the farm's name
def create_wepay_account
  if self.has_wepay_access_token? && !self.has_wepay_account?
    params = { :name => self.campaign.title, :description => "Campaign Donating " + self.campaign.title }			
    response = CrowdFunding::Application::WEPAY.call("/account/create", self.wepay_access_token, params)

    if response["account_id"]
      self.wepay_account_id = response["account_id"]
      return self.save
    else
      raise "Error - " + response["error_description"]
    end

  end		
  raise "Error - cannot create WePay account"
end
end

