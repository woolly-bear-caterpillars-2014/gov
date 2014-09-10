congress_people = NytimesService.get_congress
congress_people.each do |congressperson|
	person = CongressPerson.create(congressperson)
	sunlight_updates = SunlightCongressService.updated_legislator_info(person.bioguide_id)
	person.update(sunlight_updates)
end

state_list = StatesService::STATE_LIST
state_list.each do |state_abrev, state_full|
	State.create(abbreviation: state_abrev, name: state_full)
end

CongressPerson.all.each do |person|
	BingService.find_keyword("#{person.first_name}" + " " + "#{person.last_name}").each do |art|
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

	articles = NytimesService.get_articles(person)
	articles.each do |article|
		a = Article.create(article)
		ArticleCongressPerson.create(article: a, congress_person: person)
	end

	bills = SunlightCongressService.get_bills(person.bioguide_id)
	bills.each do |bill|
		l = Legislation.create(bill)		
		LegislationCongressPerson.create(legislation: l, congress_person: person)
	end
end

