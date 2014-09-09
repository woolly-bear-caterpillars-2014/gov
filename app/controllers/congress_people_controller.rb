class CongressPeopleController < ApplicationController
  def index
    @congress_people = CongressPerson.all
  end

  def show
    @congress_person = CongressPerson.find(params[:id])
    @articles = @congress_person.articles
    @bills = @congress_person.legislations
  end

  def show_bills
    @congress_person = CongressPerson.find(params[:id])
    @bills = @congress_person.articles
  end

  def show_articles
    @congress_person = CongressPerson.find(params[:id])
    @articles = @congress_person.articles
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
    person = CongressPerson.find(params[:id])
    p person

    # send_email_to_congress_member(params[:email])

    redirect_to root_url
  end
end
