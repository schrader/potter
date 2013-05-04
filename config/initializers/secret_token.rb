# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Potter::Application.config.secret_key_base = '6def17039bd089b487c33a696c4a3cb5648b9a15395799825cf1d8ed6923ce71870643085c9b259a80a891d520927e349e7081675c148a3c4053462fbe44218d'
Potter::Application.configure