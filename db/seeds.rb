
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

state_list = {
	'AL' => "Alabama",
	'AK' => "Alaska",
	'AZ' => "Arizona",
	'AR' => "Arkansas",
	'CA' => "California",
	'CO' => "Colorado",
	'CT' => "Connecticut",
	'DE' => "Delaware",
	'DC' => "District Of Columbia",
	'FL' => "Florida",
	'GA' => "Georgia",
	'HI' => "Hawaii",
	'ID' => "Idaho",
	'IL' => "Illinois",
	'IN' => "Indiana",
	'IA' => "Iowa",
	'KS' => "Kansas",
	'KY' => "Kentucky",
	'LA' => "Louisiana",
	'ME' => "Maine",
	'MD' => "Maryland",
	'MA' => "Massachusetts",
	'MI' => "Michigan",
	'MN' => "Minnesota",
	'MS' => "Mississippi",
	'MO' => "Missouri",
	'MT' => "Montana",
	'NE' => "Nebraska",
	'NV' => "Nevada",
	'NH' => "New Hampshire",
	'NJ' => "New Jersey",
	'NM' => "New Mexico",
	'NY' => "New York",
	'NC' => "North Carolina",
	'ND' => "North Dakota",
	'OH' => "Ohio",
	'OK' => "Oklahoma",
	'OR' => "Oregon",
	'PA' => "Pennsylvania",
	'RI' => "Rhode Island",
	'SC' => "South Carolina",
	'SD' => "South Dakota",
	'TN' => "Tennessee",
	'TX' => "Texas",
	'UT' => "Utah",
	'VT' => "Vermont",
	'VA' => "Virginia",
	'WA' => "Washington",
	'WV' => "West Virginia",
	'WI' => "Wisconsin",
	'WY' => "Wyoming"
}

state_list.each do |state_abrev, state_full|
	s = State.find_by(abbreviation: state_abrev)
	s.name = state_full
	s.save
end

<<<<<<< HEAD
# CongressPerson.all.each do |person|
# 	BingHelper.find_keyword("#{person.first_name}" + " " + "#{person.last_name}").each do |art|
# 		bing = Article.new(
# 			title: art[:Title],
# 			first_paragraph: art[:Description],
# 			publication_date: art[:Date],
# 			url: art[:Url],
# 			source: art[:Source]
# 		)

# 		ArticleCongressPerson.new(
# 			article: bing,
# 			congress_person: person
# 		)
# 	end
	NytimesHelper.query_by_keywords("#{person.first_name}" + " " + "#{person.last_name}")['response']['docs'].each do |article|
=======
CongressPerson.all.each do |person|
	articles = NytimesHelper.query_by_keywords("#{person.first_name}" + " " + "#{person.last_name}")['response']['docs']
	articles.each do |article|
>>>>>>> ee404e655ad693fd629e1a26056d8c5a2f4208f2
		a = Article.create(
			title: article['headline']['main'],
			first_paragraph: article['lead_paragraph'],
			publication_date: article['pub_date'],
			url: article['web_url'],
			source: 'New York Times'
		)

		ArticleCongressPerson.create(
			article: a,
			congress_person: person
		)
	end

	bills = SunlightCongressHelper.get_bills(person.bioguide_id)
	bills.each do |bill|
		l = Legislation.create(
			number: bill[:number],
      bill_id: bill[:number],
      pdf_url: bill[:number],
      introduced_on: bill[:number],
      last_version_on: bill[:number],
      official_title: bill[:number],
      short_title: bill[:number]
		)
		
		LegislationCongressPerson.create(
			legislation: l,
			congress_person: person	
		)
	end
end



# CongressPerson.all.each do |congressperson|
# 	NytimesHelper.query_by_keywords(NytimesHelper.remove_stops(leg))['response']['docs'].each do |article|
# 		a = Article.create(
# 			title: article['headline']['main'],
# 			first_paragraph: article['lead_paragraph'],
# 			publication_date: article['pub_date'],
# 			url: article['web_url'],
# 			source: 'New York Times')
# 		ArticlesLegislation.create(
# 			article: a,
# 			legislation: leg)
# 	end
# end

