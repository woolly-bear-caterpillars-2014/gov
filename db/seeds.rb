
NytimesHelper.fetch_house["results"].first["members"].each do |congressperson|
	person = CongressPerson.create(
		bioguide_id: congressperson["id"],
		first_name: congressperson["first_name"],
		last_name: congressperson["last_name"],
		title: "Congressperson",
		party: congressperson["party"],
		twitter_account: congressperson["twitter_account"],
		facebook_account: congressperson["facebook_account"],
		votes_with_party_pct: congressperson["votes_with_party_pct"],
		website_url: congressperson["url"],
		missed_votes_pct: congressperson["missed_votes_pct"],
		seniority: congressperson["seniority"],
		district: congressperson["district"],
		next_election: congressperson["next_election"],
		picture_id: "http://theunitedstates.io/images/congress/225x275/#{congressperson["id"]}.jpg",
		state: State.find_or_create_by(
			abbreviation: congressperson["state"]
		)
	)
end

NytimesHelper.fetch_senate["results"].first["members"].each do |congressperson|
	person = CongressPerson.create(
		bioguide_id: congressperson["id"],
		first_name: congressperson["first_name"],
		last_name: congressperson["last_name"],
		title: "Senator",
		party: congressperson["party"],
		twitter_account: congressperson["twitter_account"],
		facebook_account: congressperson["facebook_account"],
		votes_with_party_pct: congressperson["votes_with_party_pct"],
		website_url: congressperson["url"],
		missed_votes_pct: congressperson["missed_votes_pct"],
		seniority: congressperson["seniority"],
		district: congressperson["district"],
		next_election: congressperson["next_election"],
		picture_id: "http://theunitedstates.io/images/congress/225x275/#{congressperson["id"]}.jpg",
		state: State.find_or_create_by(
			abbreviation: congressperson["state"]
		)
	)
end

# CongressPerson.all.each do |person|
# 	NytimesHelper.query_by_keywords("#{person.first_name}" + " " + "#{person.last_name}")['response']['docs'].each do |article|
# 		a = Article.create(
# 			title: article['headline']['main'],
# 			first_paragraph: article['lead_paragraph'],
# 			publication_date: article['pub_date'],
# 			url: article['web_url'],
# 			source: 'New York Times'
# 		)

# 		ArticleCongressPerson.create(
# 			article: a,
# 			congress_person: person
# 		)
# 	end
# end

# CongressPerson.all.each do |person|

# 	person.photo_url = picture_id
# end



# CongressPerson.all.each do |congressperson|
# 	NytimesHelper.query_by_keywords(NytimesHelper.remove_stops(leg))['response']['docs'].each do |article|
# # 		a = Article.create(
# # 			title: article['headline']['main'],
# # 			first_paragraph: article['lead_paragraph'],
# # 			publication_date: article['pub_date'],
# # 			url: article['web_url'],
# 			source: 'New York Times')
# 		ArticlesLegislation.create(
# 			article: a,
# 			legislation: leg)
# 	end
# end

# keywords_to_fetch.each do |legislation|
# 	k = NytimesHelper.query_by_keywords(legislation.title)
# 	k.each do |article|
# 		article[]
# end

#   t.string :title
#       t.text :first_paragraph
#       t.date :publication_date
#       t.string :url
#       t.string :source




#  headline = @parsed_reply["response"]["docs"].first["headline"]["main"]
# 			 snippet = @parsed_reply["response"]["docs"].first["snippet"]
# 			 url = @parsed_reply["response"]["docs"].first["web_url"]




