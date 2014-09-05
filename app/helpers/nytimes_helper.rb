
require 'net/http'
require 'json'
require 'open-uri'
module NytimesHelper
	class << self
		attr_accessor :url, :parsed_reply
		API_KEY = ENV['ARTICLE_SEARCH']
		BASE_URI = 'http://api.nytimes.com/svc/search/v2/articlesearch.json?'

		def get_url(string)
			params = string.split(' ').join('&')
			@url = ("#{BASE_URI}" + "q=(field:)#{params}&fq=pub_year:(2014)" + "&api-key=#{API_KEY}")
		end

		#returns ten articles that match that keyword
		def query_by_keywords(search)
			get_url(search)
			uri = URI(url)
			reply = uri.read
			@parsed_reply = JSON.parse reply
		end

		def pass_back_to_user
			 headline = @parsed_reply["response"]["docs"].first["headline"]["main"]
			 snippet = @parsed_reply["response"]["docs"].first["snippet"]
			 url = @parsed_reply["response"]["docs"].first["web_url"]
			 
			 p snippet
			 p headline
			 p url
		end

		def self.is_stale?
			if NytimesHelper	
			end
		end

	end
end


