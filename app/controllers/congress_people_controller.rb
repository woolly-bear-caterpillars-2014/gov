class CongressPeopleController < ApplicationController

  def sentiment_visualization
    @congressperson = CongressPerson.find(params[:id])
    @tweets_to_render = @congressperson.relevant_tweets
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
    p @bills = @congress_person.legislations.order('introduced_on DESC')

  end

  def new
    @congress_person = CongressPerson.new
  end

  def edit
  end

  def create
     congress_person = CongressPerson.find(params[:id])
    p congress_person.oc_email
    p params[:body]
    p params[:oc_email] # check for valid email

    CongressPeopleMailer.send_mail(params[:email])

    redirect_to root_url
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
