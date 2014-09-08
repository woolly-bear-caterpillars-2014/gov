class State < ActiveRecord::Base
	has_many :congress_people

	def congress_people_count
		self.congress_people.length
	end

	def republican_count
		self.congress_people.select{ |a| a.party == "R"}.length
	end

	def democrat_count
		self.congress_people.select{ |a| a.party == "D"}.length
	end

	def independent_count
		self.congress_people.select{ |a| a.party == "I"}.length
	end

	def political_leaning
		#0 will be when every representative is a republican
		#100 will be when every rep is a democrat
		((self.democrat_count / self.congress_people_count.to_f) * 100)
	end

	def generate_hash
    {
      name: self.abbreviation,
      democrat_count: self.democrat_count,
      republican_count: self.republican_count,
      independent_count: self.independent_count,
      political_leaning: self.political_leaning
    }
	end
end
