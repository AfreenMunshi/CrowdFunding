class CampaignMailer < ActionMailer::Base
  default from: "bucksbackers@gmail.com"

def welcome_email(user, campaign)
    @user = user
    @campaign = campaign
    @url  = 'https://localhost.ssl:3000/users/sign_in'
    mail(to: @user.email, subject: 'Congratulations')
  end

end
