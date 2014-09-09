module CongressPeopleHelper
	
	def get_relevant_tweets
		RESTCLIENT.search("#{self.first_name}" + " " + "#{self.last_name}", :result_type => "recent").take(50)
	end

	
end

