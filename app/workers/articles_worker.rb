# class ArticlesWorker
#   include Sidekiq::Worker

#   def perform(article_id)
#     NytimesService.query_by_keywords("#{person.first_name}" + " " + "#{person.last_name}")['response']['docs'].each do |article|
# 			a = Article.find_or_create_by(
# 				title: article['headline']['main'],
# 				first_paragraph: article['lead_paragraph'],
# 				publication_date: article['pub_date'],
# 				url: article['web_url'],
# 				source: 'New York Times'
# 			)
# 			ArticleCongressPerson.find_or_create_by(
# 				article: a,
# 				congress_person: person
# 			)
# 		end
#   end
# end

# ArticlesWorker.new.perform(@project.id)  ## NOT BACKGROUND
# ArticlesWorker.perform_async(@project.id)
# ArticlesWorker.perform_at(2.days.from_now, @project.id)