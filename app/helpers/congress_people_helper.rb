require 'mail'

module CongressPeopleHelper

	def party_name(congress_person)
		return "democrat" if congress_person.party == "D"
		return "republican" if congress_person.party = "R"
		congress_person.party
	end

	def card_class(congress_person)
		"#{congress_person.type}-card-#{party_name(congress_person)}"
	end

	class << self
		def send_mail(from_add,to_add,e_subject,e_body)
			mail = Mail.new(from: from_add, to: to_add, subject: e_subject, body: e_body)
			mail.to_s
			mail.delivery_method :sendmail
			mail.deliver
		end
	end
end
