class CampaignMailer < ActionMailer::Base
  default from: "notifications@bucksbacker.com"

def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Congratulations...')
  end

end
