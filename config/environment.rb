# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!



#Twitter configuration

twitter_config = YAML.load_file(APP_ROOT.join('config', 'twitter.yml'))

twitter_config.each do |key, value|
	ENV[key]=value
end

CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['TWITTER_KEY']
  config.consumer_secret = ENV['TWITTER_SECRET']
  config.access_token = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end