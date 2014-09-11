state_list = StatesService::STATE_LIST
state_list.each do |state_abrev, state_full|
	s = State.create(abbreviation: state_abrev, name: state_full)
  puts "#{s.name}, #{s.abbreviation}"
end

congress_people = NytimesService.get_congress
congress_people.each do |congressperson|
	person = CongressPerson.create(congressperson)
	sunlight_updates = SunlightCongressService.updated_legislator_info(person.bioguide_id)
	person.update(sunlight_updates)
end

CongressPerson.all.each do |person|
	bing_articles = BingService.get_articles(person)
	bing_articles.each do |article|
		a = Article.create(article)
		ArticleCongressPerson.create(article: a, congress_person: person)
	end

	nyt_articles = NytimesService.get_articles(person)
	nyt_articles.each do |article|
		a = Article.create(article)
		ArticleCongressPerson.create(article: a, congress_person: person)
	end

	bills = SunlightCongressService.get_bills(person.bioguide_id)
	bills.each do |bill|
		l = Legislation.create(bill)		
		LegislationCongressPerson.create(legislation: l, congress_person: person)
	end
end

