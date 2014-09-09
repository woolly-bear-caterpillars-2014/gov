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

	def get_relevant_tweets
		RESTCLIENT.search("#{self.first_name}" + " " + "#{self.last_name}", :result_type => "recent").take(50)
	end

	

end
