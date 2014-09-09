require 'net/http'
require 'json'
require 'open-uri'

module SunlightCongressHelper
	class << self
		attr_accessor :url, :parsed_reply

		BILL_URI = 'http://congress.api.sunlightfoundation.com/bills?'
		LEGISLATORS_URI = 'congress.api.sunlightfoundation.com/legislators?'
		API_KEY = ENV['SUNLIGHT_KEY']

		def get_bills(sponsor_id)
			url = ("#{BILL_URI}" + "sponsor_id=#{sponsor_id}" + "&apikey=#{API_KEY}")
			p url
			uri = URI(url)
			reply = uri.read
			parsed_reply = JSON.parse reply
			bills = get_filtered_bills(parsed_reply)
		end

		def get_legislators(sponsor_id)
			url = ("#{LEGISLATORS_URI}" + "apikey=#{API_KEY}")
			p url
			uri = URI(url)
			reply = uri.read
			parsed_reply = JSON.parse reply
			legislators = get_filtered_legislators(parsed_reply)
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
			bill[:introduced_on] = parse_date(bill_hash["introduced_on"])
			bill[:last_version_on] = parse_date(bill_hash["last_version_on"])
			bill[:official_title] = bill_hash["official_title"]
			bill[:short_title] = bill_hash["short_title"]
			bill
		end

		def get_filtered_legislators(parsed_reply)
			legislators = Array.new
			parsed_reply["results"].each do |legislator_hash|
				legislators << filter_legislator(legislator_hash)
			end
			legislators
		end

		def filter_legislator(bill_hash)
			person = Hash.new
			person[:bioguide_id] = person_hash["bioguide_id"]
			person[:oc_email] = person_hash["oc_email"]
			person[:office_adress] = person_hash["first_name"]
			person[:contact_form] = person_hash["last_name"]
			person[:term_start] = parse_date(person_hash["term_start"])
			person[:term_end] = parse_date(person_hash["term_end"])
			person[:birthday] = parse_date(person_hash["birthday"])
			person
		end

		def parse_date(date_str)
			Date.strptime(date_str, "%Y-%m-%d")
		end
	end
end

# sponsor_id = "L000575"
# bills = SunlightCongressHelper.get_bills(sponsor_id)

# sponsor_id = CongressPerson.first.bioguide_id
# bills = SunlightCongressHelper.get_bills(sponsor_id)
# bills.each do |bill| puts bill[:title] end