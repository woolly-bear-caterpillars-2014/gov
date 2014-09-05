# require 'federal_register'
class TestsController < ApplicationController
  def index
    @result_set = FederalRegister::Article.search(:conditions => {:term => "Accessibility"})
    puts "data: #{@result_set}"

    # if request.xhr?
    #   render json: "hi".to_json
    # else
    #   render :index
    # end
  end
end
