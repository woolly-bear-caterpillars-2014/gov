# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# result_set = FederalRegister::Article.search(:conditions => {:term => "Accessibility"}).take(50)

# result_set.each do |doc|
# 	Fedreg.create(type_of_doc: doc.type, title: doc.title, abstract: doc.abstract, pub_date: doc.publication_date)
# end
FederalRegisterHelper.search_by_date('2014-06-01')['results'].each do |result|
	Legislation.create(
	  title: result['title'],
	  publication_date: result['publication_date'],
      abstract: result['abstract'],
      url: result['html_url'])
end

# keywords_to_fetch = Legistation.take(10)

Legislation.all.each do |leg|
	NytimesHelper.query_by_keywords(leg.title)
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




