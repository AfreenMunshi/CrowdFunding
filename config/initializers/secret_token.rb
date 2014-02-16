# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
CF::Application.config.secret_key_base = '46f665f1aebdffbf087deb9c5b01fb8f807cd7fbf9670aa19297457f7e2def3447d6d8ba6cff3c8ae141818262c44fee48b40496a524320186d4641361af9855'
