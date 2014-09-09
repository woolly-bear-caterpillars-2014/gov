require 'net/http'
require 'json'
require 'open-uri'

module SunlightCongressHelper
	class << self
		attr_accessor :url, :parsed_reply

		BASE_URI = 'http://congress.api.sunlightfoundation.com/bills?'
		API_KEY = ENV['SUNLIGHT_KEY']

		def get_bills(sponsor_id)
			url = ("#{BASE_URI}" + "sponsor_id=#{sponsor_id}" + "&apikey=#{API_KEY}")
			p url
			uri = URI(url)
			reply = uri.read
			parsed_reply = JSON.parse reply
			bills = get_filtered_bills(parsed_reply)
		end

		private

		def get_filtered_bills(parsed_reply)
			bills = Array.new
			parsed_reply["results"].each do |bill_hash|
				bills << filter_bill(bill_hash)
			end
			bills
		end

		def filter_bill(bill_hash)
			bill = Hash.new
			bill[:number] = bill_hash["number"]
			if bill_hash["last_version"] != nil
				bill[:bill_id] = bill_hash["last_version"]["bill_version_id"]
				bill[:pdf_url] = bill_hash["last_version"]["urls"]["pdf"]
			else
				bill[:bill_id] = "invalid"
				bill[:pdf_url] = "invalid"
			end
			bill[:introduced_on] = bill_hash["introduced_on"]
			bill[:last_version_on] = bill_hash["last_version_on"]
			bill[:official_title] = bill_hash["official_title"]
			bill[:short_title] = bill_hash["short_title"]
			bill
		end
	end
end
sponsor_id = "L000575"
bills = SunlightCongressHelper.get_bills(sponsor_id)

# sponsor_id = CongressPerson.first.bioguide_id
# bills = SunlightCongressHelper.get_bills(sponsor_id)
# bills.each do |bill| puts bill[:title] end