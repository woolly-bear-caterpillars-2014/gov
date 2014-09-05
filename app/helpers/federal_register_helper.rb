require 'open-uri'
require 'json'

module FederalRegisterHelper
	def search_by_date(date_as_string)
		url = "https://www.federalregister.gov/api/v1/articles.json?&conditions%5Beffective_date%5D%5Bis%5D=#{params}"
		uri = URI(url)
		reply = uri.read
		parsed_reply = JSON.parse reply
	end
end


