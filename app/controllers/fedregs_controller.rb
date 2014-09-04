class FedregsController < ApplicationController
	def index
    @fedregs = Fedreg.all
    p @fedregs
    if request.xhr?
      render json: @fedregs.to_json
    else
      render :index
    end
  end
end
