class ArticlesLegislation < ActiveRecord::Base
	belongs_to :article
	belongs_to :legislation
end
