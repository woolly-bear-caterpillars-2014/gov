class Article < ActiveRecord::Base
	has_many :articles_legislations
	has_many :legislations, through: :articles_legislations
end
