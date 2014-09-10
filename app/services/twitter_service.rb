class TwitterService
	TWITTER_KEY = ENV["TWITTER_KEY"]
	TWITTER_SECRET = ENV["TWITTER_SECRET"]
	ACCESS_TOKEN = ENV["ACCESS_TOKEN"]
	ACCESS_TOKEN_SECRET = ENV["ACCESS_TOKEN_SECRET"]

	def self.last_arr
		last_names = ['Barack','Obama']
		CongressPerson.all.each do |c|
			last_names << c.last_name
		end
		return last_names.take(299).join(',')
	end

	def self.run
    Thread.new do
     	STREAMINGCLIENT.filter(:track => last_arr) do |tweet|
      	unless tweet.geo.coordinates.nil?
	        File.open("public/data/data.json","w") do |f|
	          f.write(tweet.to_json)
	        end
        end
      end 
    end
  end
end
