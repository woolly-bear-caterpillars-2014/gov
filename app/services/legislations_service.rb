require 'open-uri'
require 'json'

class LegislationsService
  def self.search_by_date_fedreg(date_as_string)
		url = "https://www.federalregister.gov/api/v1/articles.json?&conditions%5Beffective_date%5D%5Bis%5D=#{date_as_string}"
		uri = URI(url)
		reply = uri.read
		parsed_reply = JSON.parse reply
	end

	def self.search_by_date_govtrack(date_as_string)
		url = "https://www.govtrack.us/api/v2/bill?introduced_date=#{date_as_string}&limit=5"
		uri = URI(url)
		reply = uri.read
		parsed_reply = JSON.parse reply
	end
end
