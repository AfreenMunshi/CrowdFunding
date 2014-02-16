Recaptcha.configure do |config|
  config.public_key  = '6Lfmqu4SAAAAAET1n4uLNP28QeBPkVrWxOOcjVQ4'
  config.private_key = '6Lfmqu4SAAAAAOa8dV-rWTmO2xxTEEIlMAQaVmws'
  #config.proxy = 'http://myproxy.com.au:8080'
end

# Recaptcha.with_configuration(:public_key => '12345') do
#   # Do stuff with the overwritten public_key.
# end