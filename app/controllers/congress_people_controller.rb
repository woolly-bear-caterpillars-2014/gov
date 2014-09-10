class CongressPeopleController < ApplicationController

  def sentiment_visualization
    @congressperson = CongressPerson.find(params[:id])
    @congressperson.relevant_tweets
    @tweets_to_render = @congressperson.relevant_tweets
    @sentiment_array = @congressperson.preserve_alchemy_map
    @sentiment_array.to_json
   
  end


  def index
    @congress_people = CongressPerson.all
  end

  def show
    @congress_person = CongressPerson.find(params[:id])

    @articles = @congress_person.articles.order('publication_date DESC')
    p @bills = @congress_person.legislations.order('introduced_on DESC')

  end

  def new
    @congress_person = CongressPerson.new
  end

  def edit
  end

  def create
  end

  def update
  end

   private
    def congress_person_params
      # It's mandatory to specify the nested attributes that should be whitelisted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
      params.require(:person).permit(:from, :to, :body)
    end
end


