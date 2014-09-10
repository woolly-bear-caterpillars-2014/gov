class CongressPeopleController < ApplicationController
  def index
    @congress_people = CongressPerson.all
  end

  def show
    @congress_person = CongressPerson.find(params[:id])

    @articles = @congress_person.articles.order('publication_date DESC')
    @bills = @congress_person.legislations.order('introduced_on DESC')
  end

  def sentiment_visualization
    @congressperson = CongressPerson.find(params[:id])
    @congressperson.relevant_tweets
    @tweets_to_render = @congressperson.relevant_tweets
    @sentiment_array = @congressperson.preserve_alchemy_map
    if request.xhr?
      render json: @sentiment_array.to_json
    end
  end
end


