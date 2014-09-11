require 'yaml'

twitter_config = YAML.load_file('config/twitter.yml')

twitter_config.each do |key, value|
	ENV[key]=value
end

RESTCLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['TWITTER_KEY']
  config.consumer_secret = ENV['TWITTER_SECRET']
  config.access_token = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end


STREAMINGCLIENT = Twitter::Streaming::Client.new do |config|
  config.consumer_key = ENV['TWITTER_KEY']
  config.consumer_secret = ENV['TWITTER_SECRET']
  config.access_token = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end

article_config = YAML.load_file('config/nyt.yml')

article_config.each do |key, value|
	ENV[key] = value
end

alchemy = YAML.load_file('config/alchemy.yml')

alchemy.each do |key, value|
  ENV[key] = value
end

# sunlight_config = YAML.load_file('config/sunlight.yml')
sunlight_config = YAML.load_file('config/sunlight.yml')

sunlight_config.each do |key, value|
  ENV[key] = value
end

# Sunlight::Base.api_key = ENV['SUNLIGHT_KEY']

# Base.api_key = ENV['ARTICLE_SEARCH']

bing_config = YAML.load_file('config/bing.yml')

bing_config.each do |key, value|
  ENV[key] = value
end

fb_config = YAML.load_file('config/fb.yml')

fb_config.each do |key, value|
  ENV[key] = value
end
