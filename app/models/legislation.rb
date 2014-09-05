class Legislation < ActiveRecord::Base
	has_many :articles_legislations
	has_many :articles, through: :articles_legislations
end
