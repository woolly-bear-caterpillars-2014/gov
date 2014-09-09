class CongressPeopleController < ApplicationController

  def sentiment_visualization
    @congressperson = CongressPerson.find(params[:id])
    @congressperson.relevant_tweets
    @sentiment_array = @congressperson.preserve_alchemy_map
    if request.xhr?
      render json: @sentiment_array.to_json
    end
  end


  def index
    @congress_people = CongressPerson.all
  end

  def show
    @congress_person = CongressPerson.find(params[:id])

    @articles = @congress_person.articles.order('publication_date DESC')
    @bills = @congress_person.legislations

  end

  def new
    @congress_person = CongressPerson.new
  end

  def edit
  end

  def create
    @congress_person = CongressPerson.new(congress_person_params)

    redirect_to congess_person_path
  end

  def update
    congress_member = CongressPerson.find(params[:id])
    # p congress_member.email
    # p params[:email_text]
    # p params[:email] # check for valid email

    # send_email_to_congress_member()

    redirect_to root_url
  end
end
