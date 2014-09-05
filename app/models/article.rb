class Article < ActiveRecord::Base
	has_many :legislations, through: :articles_legislations
end
