require 'net/http'
require 'json'
require 'open-uri'

module BingHelper
	class << self
		BING_KEY = ENV['BING_KEY']
		def find_keyword(name)
			bing_news1 = Bing.new("#{BING_KEY}",1,'News')
			p bing_news1
			bing_news = bing_news1.search(name).last
		return bing_news[:News]
		end
	end
end
