congress_people = NytimesHelper.get_congress
congress_people.each do |congressperson|
	person = CongressPerson.create(congressperson)
	sunlight_updates = SunlightCongressHelper.updated_legislator_info(person.bioguide_id)
	person.update(sunlight_updates)
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

CongressPerson.all.each do |person|
	BingHelper.find_keyword("#{person.first_name}" + " " + "#{person.last_name}").each do |art|
		bing = Article.create(
			title: art[:Title],
			first_paragraph: art[:Description],
			publication_date: art[:Date],
			url: art[:Url],
			source: art[:Source]
		)
		p bing

		ArticleCongressPerson.create(
			article: bing,
			congress_person: person
		)
	end
	
	NytimesHelper.query_by_keywords("#{person.first_name}" + " " + "#{person.last_name}")['response']['docs'].each do |article|
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
		l = Legislation.create(bill)		
		LegislationCongressPerson.create(
			legislation: l,
			congress_person: person
		)
	end
end

