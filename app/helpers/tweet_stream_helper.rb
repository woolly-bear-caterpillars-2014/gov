module TweetStreamHelper
	class << self
		TWITTER_KEY = ENV["TWITTER_KEY"]
		TWITTER_SECRET = ENV["TWITTER_SECRET"]
		ACCESS_TOKEN = ENV["ACCESS_TOKEN"]
		ACCESS_TOKEN_SECRET = ENV["ACCESS_TOKEN_SECRET"]

	def run
	    Thread.new do
	      STREAMINGCLIENT.filter(:locations => '-74,40,-73,41') do |tweet|
	        File.open("public/data/data.json","w") do |f|
	          f.write(tweet.to_json)
          end
	      end 
	    end
	  end
	end
end
