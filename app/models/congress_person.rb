class CongressPerson < ActiveRecord::Base
	has_many :article_congress_people
	has_many :articles, through: :article_congress_people
	belongs_to :state

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
		RESTCLIENT.search("#{self.first_name}" + " " + "#{self.last_name}", :result_type => "recent").take(50)
	end

	def sentiment(tweet)
		# alchemy = AlchemyApi.new
		# response = alchemy.sentiment('text', tweet)
		# JSON.pretty_generate(response)
		# response['docSentiment']['score']
	end

	def sentiment_map
		alchemy = AlchemyApi.new
		sentiments = []
		self.relevant_tweets.each do |tweet|
			sentiments << {text: tweet.text, sentiment_score: alchemy.sentiment('text', tweet.text)['docSentiment']['score'], uri: tweet.uri}
		end	
		sentiments
	end


end
