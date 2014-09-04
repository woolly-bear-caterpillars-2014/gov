
require 'pry'
require 'net/http'
require 'json'
module NytimesHelper
	class << self
		API_KEY = 'b71fa36db552c767ec607525e67daac4:10:63456932'
		API_SERVER = 'api.nytimes.com'
		BASE_URI = '/svc/search/v2/articlesearch'
		RESPONSE_FORMAT = '.json?'
	
		def search(params={})
			uri = URI("http://" + "#{API_SERVER}" + "#{BASE_URI}" + "#{RESPONSE_FORMAT}" + "[#{params}]" + "&api-key=#{API_KEY}")
			reply = uri.read
			parsed_reply = JSON.parse reply
			p parsed_reply
			#puts uri
		end
	end
end


binding.pry