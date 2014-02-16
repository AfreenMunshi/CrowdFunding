Recaptcha.configure do |config|
  config.public_key  = ''
  config.private_key = ''
  #config.proxy = 'http://myproxy.com.au:8080'
end

# Recaptcha.with_configuration(:public_key => '12345') do
#   # Do stuff with the overwritten public_key.
# end