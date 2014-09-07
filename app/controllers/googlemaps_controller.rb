class GooglemapsController < ApplicationController
	def index
		STREAMINGCLIENT.filter('-180,-90,180,90') do |tweet|
		p tweet.geo.coordinates
		end
	end
  
end