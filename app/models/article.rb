class Article < ActiveRecord::Base
	has_many :article_congress_people
	has_many :congres_people, through: article_congress_people
end
