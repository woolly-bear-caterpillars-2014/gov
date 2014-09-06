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

stop_words = %w(a able about above abst accordance according accordingly across act actually added adj affected affecting affects after afterwards again against ah all almost alone along already also although always am among amongst an and announce another any anybody anyhow anymore anyone anything anyway anyways anywhere apparently approximately are aren arent arise around as aside ask asking at auth available away awfully b back be became because become becomes becoming been before beforehand begin beginning beginnings begins behind being believe below beside besides between beyond biol both brief briefly but by c ca came can cannot can't cause causes certain certainly co com come comes contain containing contains could couldnt d date did didn't different do does doesn't doing done don't down downwards due during e each ed edu effect eg eight eighty either else elsewhere end ending enough especially et et-al etc even ever every everybody everyone everything everywhere ex except f far few ff fifth first five fix followed following follows for former formerly forth found four from further furthermore g gave get gets getting give given gives giving go goes gone got gotten h had happens hardly has hasn't have haven't having he hed hence her here hereafter hereby herein heres hereupon hers herself hes hi hid him himself his hither home how howbeit however hundred i id ie if i'll im immediate immediately importance important in inc indeed index information instead into invention inward is isn't it itd it'll its itself i've j just k keep keeps kept kg km know known knows l largely last lately later latter latterly least less lest let lets like liked likely line little 'll look looking looks ltd m made mainly make makes many may maybe me mean means meantime meanwhile merely mg might million miss ml more moreover most mostly mr mrs much mug must my myself n na name namely nay nd near nearly necessarily necessary need needs neither never nevertheless new next nine ninety no nobody non none nonetheless noone nor normally nos not noted nothing now nowhere o obtain obtained obviously of off often oh ok okay old omitted on once one ones only onto or ord other others otherwise ought our ours ourselves out outside over overall owing own p page pages part particular particularly past per perhaps placed please plus poorly possible possibly potentially pp predominantly present previously primarily probably promptly proud provides put q que quickly quite qv r ran rather rd re readily really recent recently ref refs regarding regardless regards related relatively research respectively resulted resulting results right run s said same saw say saying says sec section see seeing seem seemed seeming seems seen self selves sent seven several shall she shed she'll shes should shouldn't show showed shown showns shows significant significantly similar similarly since six slightly so some somebody somehow someone somethan something sometime sometimes somewhat somewhere soon sorry specifically specified specify specifying still stop strongly sub substantially successfully such sufficiently suggest sup sure)

LegislationsHelper.search_by_date_fedreg('2014-06-01')['results'].each do |result|
	Legislation.create(
	  title: result['title'],
	  publication_date: result['publication_date'],
      abstract: result['abstract'],
      url: result['html_url'])
end

LegislationsHelper.search_by_date_govtrack('2011-01-05')['objects'].each do |object|
	Legislation.create(
	  title: object['title_without_number'],
	  publication_date: object['introduced_date'],
      abstract: object['titles'][0][2],
      url: object['thomas_link'])
end

# keywords_to_fetch = Legistation.take(10)

Legislation.all.each do |leg|
	NytimesHelper.query_by_keywords(leg.title)['response']['docs'].each do |article|
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




