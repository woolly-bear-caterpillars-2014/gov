module TweetsHandler

	# retrieve tweets
	# input name of congress people
	# outputs an array of Tweets related to their last name
	# retrieve Geolocations by streaming


	# retrieve tweets
	def TweetsStreamer(person_name, state)
		# topics = person_name.split
		STREAMINGCLIENT.filter(:track => person_name) do |object|
		  if object.is_a?(Twitter::Tweet)
		  	if object.geo
		  		puts object.geo
		  	end
		  end
		end
	end


	# retrieve Geolocations by streaming
	def GeolocationStreamer(person_name)
		tweet = TweetsStreamer(person_name)
		return tweet.geo if tweet.geo != ["null"]
	end

end

# STREAMINGCLIENT.filter(:locations => '-74,40,-73,41') do |object|
# 	p object.geo.coordinates
# 	p object.text
# end