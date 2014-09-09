require 'net/http'
require 'json'
require 'open-uri'

module NytimesHelper
	class << self
		attr_accessor :url, :parsed_reply
		API_KEY = ENV['ARTICLE_SEARCH']
		BASE_URI = 'http://api.nytimes.com/svc/search/v2/articlesearch.json?'
		CONGRESS_KEY = ENV["CONGRESS_KEY"]

		def get_url(string)
			k = string.split(' ').each{ |a| a.gsub!(/[^0-9A-Za-z]/, '')}
			params = k.join("+")
			@url = ("#{BASE_URI}" + "q=%22#{params}%22" + "&api-key=#{API_KEY}")
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
		end

		# def fetch_house
		# 	url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/113/house/members.json?api-key=#{CONGRESS_KEY}"
		# 	uri = URI(url)
		# 	p uri
		# 	reply = uri.read
		# 	parsed_reply = JSON.parse reply
		# end

		# def fetch_senate
		# 	url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/113/senate/members.json?api-key=#{CONGRESS_KEY}"
		# 	uri = URI(url)
		# 	reply = uri.read
		# 	parsed_reply = JSON.parse reply
		# end

		def remove_stops(header)
			stop_words = %w(a about above after again against all am an and any are aren't as at be because been before being below between both but by can't cannot could couldn't did didn't do does doesn't doing don't down during each few for from further had hadn't has hasn't have haven't having he he'd he'll he's her here here's hers herself him himself his how how's i i'd i'll i'm i've if in into is isn't it it's its itself let's me more most mustn't my myself no nor not of off on once only or other ought our ours ourselves out over own same shan't she she'd she'll she's should shouldn't so some such than that that's the their theirs them themselves then there there's these they they'd they'll they're they've this those through to too under until up very was wasn't we we'd we'll we're we've were weren't what what's when when's where where's which while who who's whom why why's with won't would wouldn't you you'd you'll you're you've your yours yourself yourselves)
			header.title.scan(/\w+/).reject do |w|
				stop_words.include? w
			end.join(' ')
		end
		

		def get_congress
			congress_people = Array.new
			congress_people.concat(fetch_congress_from_nyt("house"))
			congress_people.concat(fetch_congress_from_nyt("senate"))
			congress_people
		end

		def fetch_congress_from_nyt(chamber)
			url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/113/#{chamber}/members.json?api-key=#{CONGRESS_KEY}"
			uri = URI(url)
			p uri
			reply = uri.read
			parsed_reply = JSON.parse reply
			title = "Congressperson" if chamber == "house"
			title = "Senator" if chamber == "senate"
			people_from_chamber = get_filtered_legislators(parsed_reply, title)
		end

		def get_filtered_legislators(parsed_reply, title)
			people = Array.new
			parsed_reply["results"].first["members"].each do |person_hash|
				people << filter_legislator(person_hash, title)
			end
			people
		end

		def filter_legislator(person_hash, title)
			person = Hash.new
			person[:bioguide_id] = person_hash["id"],
			person[:first_name] = person_hash["first_name"],
			person[:last_name] = person_hash["last_name"],
			person[:title] = title,
			person[:party] = person_hash["party"],
			person[:twitter_account] = person_hash["twitter_account"],
			person[:facebook_account] = person_hash["facebook_account"],
			person[:votes_with_party_pct] = person_hash["votes_with_party_pct"],
			person[:website_url] = person_hash["url"],
			person[:missed_votes_pct] = person_hash["missed_votes_pct"],
			person[:seniority] = person_hash["seniority"],
			person[:district] = person_hash["district"],
			person[:next_election] = person_hash["next_election"],
			person[:picture_id] = "http://theunitedstates.io/images/congress/225x275/#{person_hash["id"]}.jpg",
			person[:state] = State.find_or_create_by(abbreviation: person_hash["state"])
			person
		end
	end
end


