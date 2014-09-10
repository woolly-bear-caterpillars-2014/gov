require 'net/http'
require 'json'
require 'open-uri'

class BingService
	BING_KEY = ENV['BING_KEY']

	def self.get_articles(person)
		articles = Array.new
		search = "#{person.first_name}" + " " + "#{person.last_name}"
		raw_articles = find_keyword(search)
		articles = filter_articles(raw_articles)
		articles
	end

	private

	def self.filter_articles(raw_articles)
		articles = Array.new
		raw_articles.each do |article|
			articles << filter_article(article)
		end
		articles
	end

	def self.filter_article(article_hash)
		article = Hash.new
		article[:title] = article_hash[:Title]
		article[:first_paragraph] = article_hash[:Description]
		article[:publication_date] = article_hash[:Date]
		article[:url] = article_hash[:Url]
		article[:source] = article_hash[:Source]
		article
	end

	def self.find_keyword(name)
		bing_news1 = Bing.new("#{BING_KEY}",1,'News')
		p bing_news1
		bing_news = bing_news1.search(name).last
		bing_news[:News]
	end
end
