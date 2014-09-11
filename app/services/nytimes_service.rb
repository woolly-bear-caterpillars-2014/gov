require 'net/http'
require 'json'
require 'open-uri'

# nyt = NytimesService.new
# nyt.import

class NytimesService
	attr_accessor :url, :parsed_reply
	API_KEY = ENV['ARTICLE_SEARCH']
	BASE_URI = 'http://api.nytimes.com/svc/search/v2/articlesearch.json?'
	CONGRESS_KEY = ENV["CONGRESS_KEY"]


	def self.get_congress
		congress_people = Array.new
		congress_people.concat(congress("house"))
		congress_people.concat(congress("senate"))
		congress_people
	end

	def self.get_articles(person)
		articles = Array.new
		words_to_search = words_to_search(person)
		words_to_search.each do |word|
			articles.concat(fetch_relevant_articles_by_keyword(person, word))
		end
		articles
	end

	private

	def self.fetch_relevant_articles_by_keyword(person, word)
		articles = Array.new
		query_by_keywords(word)['response']['docs'].each do |article|
			article['keywords'].each do |k|
				if k['name'] == "persons" && k['value'].downcase.include?(person.last_name.downcase)
					articles << filter_article(article)
				end
			end
		end
		articles
	end

	def self.filter_article(article_hash)
		filtered_article = Hash.new
		filtered_article[:title] = article_hash['headline']['main']
		filtered_article[:first_paragraph] = article_hash['lead_paragraph']
		filtered_article[:publication_date] = article_hash['pub_date']
		filtered_article[:url] = article_hash['web_url']
		filtered_article[:source] = 'New York Times'
		filtered_article
	end
	
	def self.words_to_search(person)
		chamber = person.title == "Senator" ? "senate" : "congress"
		title = person.title == "Senator" ? "Senator" : "Congressman"
		words_to_search = ["#{person.first_name} #{person.last_name}"] # 1
		words_to_search << "#{person.state.name} #{title} #{person.last_name}" # 2
		words_to_search << "#{person.state.name} Congresswoman #{person.last_name}" if title == "Congressman" # 2
		words_to_search << "#{person.state.name} #{chamber} #{person.last_name}" # 3
		words_to_search << "#{person.state.name} #{person.last_name}" # 4
		words_to_search << "#{title} #{person.last_name}" # 5
		words_to_search << "Congresswoman #{person.last_name}" if title == "Congressman" # 5
		words_to_search << "#{chamber} #{person.last_name}" # 6
		words_to_search
	end

	def self.query_by_keywords(search) #returns ten articles that match that keyword
		url = get_url(search)
		p url
		uri = URI(url)
		reply = uri.read
		@parsed_reply = JSON.parse reply
	end

	def self.get_url(string)
		k = string.split(' ').each{ |a| a.gsub!(/[^0-9A-Za-z]/, '')}
		params = k.join("+")
		url = ("#{BASE_URI}" + "q=%22#{params}%22" + "&api-key=#{API_KEY}")
	end

	def self.congress(chamber)
		url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/113/#{chamber}/members.json?api-key=#{CONGRESS_KEY}"
		uri = URI(url)
		p uri
		reply = uri.read
		parsed_reply = JSON.parse reply
		title = "Congressperson" if chamber == "house"
		title = "Senator" if chamber == "senate"
		people_from_chamber = get_filtered_legislators(parsed_reply, title)
	end

	def self.get_filtered_legislators(parsed_reply, title)
		people = Array.new
		parsed_reply["results"].first["members"].each do |person_hash|
			people << filter_legislator(person_hash, title)
		end
		people
	end

	def self.filter_legislator(person_hash, title)
		person = Hash.new
		person[:bioguide_id] = person_hash["id"]
		person[:first_name] = person_hash["first_name"]
		person[:last_name] = person_hash["last_name"]
		person[:title] = title
		person[:party] = person_hash["party"]
		person[:twitter_account] = person_hash["twitter_account"]
		person[:facebook_account] = person_hash["facebook_account"]
		person[:votes_with_party_pct] = person_hash["votes_with_party_pct"]
		person[:website_url] = person_hash["url"]
		person[:missed_votes_pct] = person_hash["missed_votes_pct"]
		person[:seniority] = person_hash["seniority"]
		person[:district] = person_hash["district"]
		person[:next_election] = person_hash["next_election"]
		person[:picture_id] = "http://theunitedstates.io/images/congress/225x275/#{person_hash["id"]}.jpg"
		puts person[:state] = State.find_or_create_by(abbreviation: person_hash["state"], name: StatesService::STATE_LIST[person_hash["state"]])
		person
	end
end
