class CongressPerson < ActiveRecord::Base
	has_many :article_congress_people
	has_many :articles, through: :article_congress_people
	belongs_to :state

	has_many :legislation_congress_people
  has_many :legislations, through: :legislation_congress_people

	def is_republican?
		if self.party == "R"
			true
		end
	end

	def is_democrat?
		if self.party = "D"
			true
		end
	end

	def is_independent?
		if self.party = "I"
			true
		end
	end
	
	def relevant_tweets
		RESTCLIENT.search("#{self.first_name}" + " " + "#{self.last_name}", :result_type => "recent").take(25)
	end

	def preserve_alchemy_map
		sentiments = []
		self.relevant_tweets.each do |tweet|
			sentiments << {tweet: tweet.text.split(" "), sentiment_score: rand(10), uri: tweet.uri}
		end	
		sentiments
	end



	def sentiment_map
		alchemy = AlchemyApi.new
		sentiments = []
		self.relevant_tweets.each do |tweet|
			sentiments << {tweet: tweet.text, sentiment_score: ((alchemy.sentiment('text', tweet.text)['docSentiment']['score']) * 10), uri: tweet.uri}
		end	
		sentiments
	end


end
