class ArticleCongressPerson < ActiveRecord::Base
	belongs_to :article 
	belongs_to :congress_person
end
