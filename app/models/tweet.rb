module TweetsHandler
	
	def TweetsStreamer(state)
		state_coord = STATE_BOUNDARY_COORDINATES[state.downcase]
		STREAMINGCLIENT.filter(:locations => state_coord) do |object|
			if object.is_a?(Twitter::Tweet)
				p object.text
				p object.geo.coordinates
			end
		end
	end

	def GetTweetsCoordinates(mention, state, num_of_tweets = 20)
		geo_coordinates = Array.new
		state_coord = STATE_CENTER_WITH_RADIUS[state.downcase]
		RESTCLIENT.search(mention, {:lang => "en", :result_type => "recent", :geocode => state_coord }).collect do |tweet|
			if tweet.geo.is_a?(Twitter::Geo::Point)
		  	geo_coordinates << {latitude: tweet.geo.coordinates[0], longitude: tweet.geo.coordinates[1]}
		 	end
		  break if geo_coordinates.count == num_of_tweets
		end
		geo_coordinates
	end

	STATE_CENTER_WITH_RADIUS = { "alabama" => "32.625,-86.685,264km", "alaska" => "61.375,-6.475,1127km", "arizona" => "34.165,-111.935,327km", "arkansas" => "34.75,-92.12,278km", "california" => "37.265,-119.27,573km", "colorado" => "39,-105.56,396km", "connecticut" => "41.525,-72.75,111km", "delaware" => "39.15,-75.4,78km", "district of columbia" => "38.935,-76.995,14km", "florida" => "27.75,-83.81,424km", "georgia" => "32.675,-83.185,271km", "hawaii" => "20.55,-157.5,306km", "idaho" => "45.5,-114.125,390km", "illinois" => "39.75,-89.5,306km", "indiana" => "39.81,-86.435,216km", "iowa" => "41.935,-93.37,362km", "kansas" => "38.5,-98.54,441km", "kentucky" => "37.885,-85.765,425km", "louisiana" => "30.97,-91.435,291km", "maine" => "45.22,-69.005,250km", "maryland" => "38.81,-77.25,250km", "massachusetts" => "42.045,-71.72,200km", "michigan" => "44.99,-86.435,453km", "minnesota" => "46.44,-93.375,431km", "mississippi" => "32.5,-89.875,278km", "missouri" => "38.31,-92.44,372km", "montana" => "46.685,-110.04,669km", "nebraska" => "41.5,-99.685,486km", "nevada" => "38.5,-117.025,390km", "new hampshire" => "44.025,-71.575,148km", "new jersey" => "40.145,-74.71,136km", "new mexico" => "34.165,-106.025,337km", "new york" => "42.76,-75.82,440km", "north carolina" => "35.225,-79.875,496km", "north dakota" => "47.465,-53.275,171km", "ohio" => "40.2,-82.67,239km", "oklahoma" => "35.31,-98.715,477km", "oregon" => "44.135,-120.515,453km", "pennsylvania" => "40.995,-77.6,325km", "puerto rico" => "18.225,-66.585,152km", "rhode island" => "41.575,-71.52,50km", "south carolina" => "33.61,-80.945,270km", "south dakota" => "44.205,-100.24,424km", "tennessee" => "35.825,-85.975,484km", "texas" => "31.165,-99.575,676km", "utah" => "39.5,-111.525,281km", "vermont" => "43.86,-72.535,127km", "u. s. virgin islands" => "18.045,-64.675,42km", "virginia" => "38,-79.465,469km", "washington" => "47.265,-120.845,437km", "west virginia" => "38.915,-80.19,274km", "wisconsin" => "44.81,-89.825,342km", "wyoming" => "43,-107.55,395km" }

	STATE_BOUNDARY_COORDINATES = { "alabama" => "-88.5,-84.87,35,30.25", "alaska" => "17.05,-30,71.5,51.25", "arizona" => "-114.87,-109,37,31.33", "arkansas" => "-94.62,-89.62,36.5,33", "california" => "-124.42,-114.12,42,32.53", "colorado" => "-109.12,-102,41,37", "connecticut" => "-73.75,-71.75,42.05,41", "delaware" => "-75.8,-75,39.85,38.45", "district of columbia" => "-77.12,-76.87,39,38.87", "florida" => "-87.62,-80,31,24.5", "georgia" => "-85.62,-80.75,35,30.35", "hawaii" => "-160.25,-154.75,22.23,18.87", "idaho" => "-117.25,-111,49,42", "illinois" => "-91.5,-87.5,42.5,37", "indiana" => "-88.12,-84.75,41.75,37.87", "iowa" => "-96.62,-90.12,43.5,40.37", "kansas" => "-102.5,-94.58,40,37", "kentucky" => "-89.58,-81.95,39.15,36.62", "louisiana" => "-94.05,-88.82,33.02,28.92", "maine" => "-71.13,-66.88,47.47,42.97", "maryland" => "-79.5,-75,39.75,37.87", "massachusetts" => "-73.52,-69.92,42.87,41.22", "michigan" => "-90.5,-82.37,48.28,41.7", "minnesota" => "-97.25,-89.5,49.38,43.5", "mississippi" => "-91.63,-88.12,35,30", "missouri" => "-95.78,-89.1,40.62,36", "montana" => "-116.05,-104.03,49,44.37", "nebraska" => "-104.05,-95.32,43,40", "nevada" => "-120,-114.05,42,35", "new hampshire" => "-72.57,-70.58,45.35,42.7", "new jersey" => "-75.55,-73.87,41.37,38.92", "new mexico" => "-109.05,-103,37,31.33", "new york" => "-79.77,-71.87,45.02,40.5", "north carolina" => "-84.33,-75.42,36.6,33.85", "north dakota" => "-10,-96.55,49,45.93", "ohio" => "-84.82,-80.52,42,38.4", "oklahoma" => "-103,-94.43,37,33.62", "oregon" => "-124.58,-116.45,46.27,42", "pennsylvania" => "-80.52,-74.68,42.27,39.72", "puerto rico" => "-67.95,-65.22,18.53,17.92", "rhode island" => "-71.92,-71.12,42.02,41.13", "south carolina" => "-83.37,-78.52,35.22,32", "south dakota" => "-104.05,-96.43,45.93,42.48", "tennessee" => "-90.32,-81.63,36.68,34.97", "texas" => "-105.65,-93.5,36.5,25.83", "utah" => "-114.05,-109,42,37", "vermont" => "-73.6,-71.47,45,42.72", "virgin islands" => "-64.8,-64.55,18.42,17.67", "virginia" => "-83.68,-75.25,39.47,36.53", "washington" => "-124.77,-116.92,49,45.53", "west virginia" => "-82.65,-77.73,40.63,37.2", "wisconsin" => "-92.9,-86.75,47.12,42.5", "wyoming" => "-111.1,-104,45,41" }
end


