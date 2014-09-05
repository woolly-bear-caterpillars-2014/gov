class FedregsController < ApplicationController
	def index
    p @result_set = FederalRegister::Article.search(:conditions => {:term => "Accessibility"})
  end

  def new
  end

  def create
    agency_name = params[:agency_name]
    p @result_set = FederalRegister::Article.search(conditions: {term: agency_name})

    if request.xhr?
      render json: @result_set.to_json
    else
      render :index
    end
  end
end
