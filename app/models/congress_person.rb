class CongressPerson < ActiveRecord::Base
	has_many :article_congress_people
	has_many :articles, through: :article_congress_people
	belongs_to :state
end
