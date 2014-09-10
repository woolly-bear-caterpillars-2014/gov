require 'net/http'
require 'json'
require 'open-uri'

class SunlightCongressService
	attr_accessor :url, :parsed_reply

	BILL_URI = 'http://congress.api.sunlightfoundation.com/bills?'
	LEGISLATORS_URI = 'http://congress.api.sunlightfoundation.com/legislators?'
	API_KEY = ENV['SUNLIGHT_KEY']

	def self.get_bills(sponsor_id)
		url = ("#{BILL_URI}" + "sponsor_id=#{sponsor_id}" + "&apikey=#{API_KEY}")
		p url
		uri = URI(url)
		reply = uri.read
		parsed_reply = JSON.parse reply
		bills = get_filtered_bills(parsed_reply)
	end

	def self.updated_legislator_info(bioguide_id)
		url = ("#{LEGISLATORS_URI}" + "bioguide_id=#{bioguide_id}" + "&apikey=#{API_KEY}")
		p url
		uri = URI(url)
		reply = uri.read
		parsed_reply = JSON.parse reply
		legislators = filter_legislator(parsed_reply)
	end

	private

	def self.get_filtered_bills(parsed_reply)
		bills = Array.new
		parsed_reply["results"].each do |bill_hash|
			bills << filter_bill(bill_hash)
		end
		bills
	end

	def self.filter_bill(bill_hash)
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

	def self.filter_legislator(person_hash)
		person = Hash.new
		unless person_hash["results"].empty?
			person[:bioguide_id] = person_hash["results"].first["bioguide_id"]
			person[:oc_email] = person_hash["results"].first["oc_email"]
			person[:office_adress] = person_hash["results"].first["first_name"]
			person[:contact_form] = person_hash["results"].first["last_name"]
			person[:term_start] = parse_date(person_hash["results"].first["term_start"])
			person[:term_end] = parse_date(person_hash["results"].first["term_end"])
			person[:birthday] = parse_date(person_hash["results"].first["birthday"])
		end
		person
	end

	def self.parse_date(date_str)
		Date.strptime(date_str, "%Y-%m-%d")
	end
end
