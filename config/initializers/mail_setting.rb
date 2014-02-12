#constancts coz har baat pe naya file nai banana hai


#TODO: need to move this out.. dot ever comit ur user name and pwd and commit!
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "localhost:3000",
  :user_name            => "",
  :password             => "",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
