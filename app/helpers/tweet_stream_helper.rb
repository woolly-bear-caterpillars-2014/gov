module TweetStreamHelper
	class << self
		TWITTER_KEY = ENV["TWITTER_KEY"]
		TWITTER_SECRET = ENV["TWITTER_SECRET"]
		ACCESS_TOKEN = ENV["ACCESS_TOKEN"]
		ACCESS_TOKEN_SECRET = ENV["ACCESS_TOKEN_SECRET"]

		def tw_config
			# TweetStream.configure do |config|
			# 	config.consumer_key = TWITTER_KEY['consumer_key']
			# 	config.consumer_secret    = TWITTER_SECRET['consumer_secret']
			# 	config.oauth_token = ACCESS_TOKEN['oauth_token']
			# 	config.oauth_token_secret = ACCESS_TOKEN_SECRET['oauth_token_secret']
			# 	config.auth_method = :oauth
			# end
		end
	end
end
