class State < ActiveRecord::Base
	has_many :congress_people

	def congress_people_count
		self.congress_people.length
	end

	def republican_count
		self.congress_people.select{ |a| a.party=="R"}.length
	end

	def democrat_count
		self.congress_people.select{ |a| a.party=="D"}.length
	end

	def independent_count
		self.congress_people.select{ |a| a.party =="I"}.length
	end

	def political_leaning
		if self.democrat_count > self.republican_count
			puts republican_count
		((self.democrat_count / self.congress_people_count.to_f) * 100).to_s + "D"
		else
			((self.republican_count/self.congress_people_count.to_f) * 100).to_s + "R"
		end
		
	end

end
