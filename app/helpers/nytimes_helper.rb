require 'net/http'
require 'json'
require 'open-uri'

module NytimesHelper
	class << self
		attr_accessor :url, :parsed_reply
		API_KEY = ENV['ARTICLE_SEARCH']
		BASE_URI = 'http://api.nytimes.com/svc/search/v2/articlesearch.json?'
		CONGRESS_KEY = ENV["CONGRESS"]

		def get_url(string)
			params = string.split(' ').join('+')
			@url = ("#{BASE_URI}" + "q=%22#{params}%22" + "&api-key=#{API_KEY}")
			p @url
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

		def fetch_house
			url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/113/house/members.json?api-key=#{CONGRESS_KEY}"
			uri = URI(url)
			reply = uri.read
			parsed_reply = JSON.parse reply
		end

		def fetch_senate
			url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/113/senate/members.json?api-key=#{CONGRESS_KEY}"
			uri = URI(url)
			reply = uri.read
			parsed_reply = JSON.parse reply
		end

		def remove_stops(header)
			stop_words = %w(a about above after again against all am an and any are aren't as at be because been before being below between both but by can't cannot could couldn't did didn't do does doesn't doing don't down during each few for from further had hadn't has hasn't have haven't having he he'd he'll he's her here here's hers herself him himself his how how's i i'd i'll i'm i've if in into is isn't it it's its itself let's me more most mustn't my myself no nor not of off on once only or other ought our ours ourselves out over own same shan't she she'd she'll she's should shouldn't so some such than that that's the their theirs them themselves then there there's these they they'd they'll they're they've this those through to too under until up very was wasn't we we'd we'll we're we've were weren't what what's when when's where where's which while who who's whom why why's with won't would wouldn't you you'd you'll you're you've your yours yourself yourselves)
			header.title.scan(/\w+/).reject do |w|
				stop_words.include? w
			end.join(' ')
		end
	end
end


