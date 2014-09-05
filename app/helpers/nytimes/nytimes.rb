
require 'pry'
require 'net/http'
require 'json'
require 'open-uri'
require 'forwardable'
module NYTimes
	API_KEY = ENV['ARTICLE_SEARCH']
	BASE_URI = 'http://api.nytimes.com/svc/search/v2/articlesearch.json?'

	class NYTimes
		attr_accessor :url, :parsed_reply

			def get_url(string)
				params = string.split(' ').join('&')
				@url = ("#{BASE_URI}" + "q=#{params}&fq=pub_year:(2014)" + "&api-key=#{API_KEY}")
			end
		
			def query_by_keywords(search)
				get_url(search)
				uri = URI(url)
				reply = uri.read
				@parsed_reply = JSON.parse reply
			end
		end
	end


		def pass_back_to_user
			 headline = @parsed_reply["response"]["docs"].first["headline"]["main"]
			 snippet = @parsed_reply["response"]["docs"].first["snippet"]
			 url = @parsed_reply["response"]["docs"].first["web_url"]

			 p snippet
			 p headline
			 p url
		end
	end
end


binding.pry