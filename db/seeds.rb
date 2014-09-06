#   Mayor.create(name: 'Emanuel', city: cities.first)

# result_set = FederalRegister::Article.search(:conditions => {:term => "Accessibility"}).take(50)

# result_set.each do |doc|
# 	Fedreg.create(type_of_doc: doc.type, title: doc.title, abstract: doc.abstract, pub_date: doc.publication_date)
# end

# LegislationsHelper.search_by_date_fedreg('2014-06-01')['results'].each do |result|
# 	Legislation.create(
# 	  title: result['title'],
# 	  publication_date: result['publication_date'],
#       abstract: result['abstract'],
#       url: result['html_url'])
# end

LegislationsHelper.search_by_date_govtrack('2011-01-05')['objects'].each do |object|
	Legislation.create(
	  title: object['title_without_number'],
	  publication_date: object['introduced_date'],
      abstract: object['titles'][0][2],
      url: object['thomas_link'])
end

# keywords_to_fetch = Legistation.take(10)

Legislation.all.each do |leg|
	NytimesHelper.query_by_keywords(NytimesHelper.remove_stops(leg))['response']['docs'].each do |article|
		a = Article.create(
			title: article['headline']['main'],
			first_paragraph: article['lead_paragraph'],
			publication_date: article['pub_date'],
			url: article['web_url'],
			source: 'New York Times')
		ArticlesLegislation.create(
			article: a,
			legislation: leg)
	end
end

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




