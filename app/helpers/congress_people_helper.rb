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
end
