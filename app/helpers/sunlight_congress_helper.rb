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
			uri = URI(url)
			reply = uri.read
			parsed_reply = JSON.parse reply
			bills = get_filtered_bills(parsed_reply)
		end

		def get_filtered_bills(parsed_reply)
			bills = Array.new
			parsed_reply["results"].each do |bill_hash|
				bills << filter_bill(bill_hash)
			end
			bills
		end

		def filter_bill(bill_hash)
			bill = Hash.new
			bill[:number] = parsed_reply["results"].first["number"]
			bill[:bill_id] = parsed_reply["results"].first["last_version"]["bill_version_id"]
			bill[:pdf_url] = parsed_reply["results"].first["last_version"]["urls"]["pdf"]
			bill[:introduced_on] = parsed_reply["results"].first["introduced_on"]
			bill[:last_version_on] = parsed_reply["results"].first["last_version_on"]
			bill[:official_title] = parsed_reply["results"].first["official_title"]
			bill[:short_title] = parsed_reply["results"].first["short_title"]

		end

		
    
    
    
    
    
    

		

	end
end


