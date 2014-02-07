# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		#User the existing token.
		File.read(token_file).chomp
	else
		#Generate a new token and store it in token_file.
		token = SecureRandom.hex(64)
		File.write(token_file,token)
		token
	end
end

#CimAdmin::Application.config.secret_key_base = 'b349d21b952d97ed2be571b9b5b0f3460942320962b8b26817d1d4cbc6fdf72d0892299624b5f48c08172d320e5c7cafd4883680cb7bf11a30ba20d83509a4dd'
CimAdmin::Application.config.secret_key_base = secure_token