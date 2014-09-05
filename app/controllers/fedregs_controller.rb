class FedregsController < ApplicationController
	def index
    p @result_set = FederalRegister::Article.search(:conditions => {:term => "Accessibility"})
  end
end
