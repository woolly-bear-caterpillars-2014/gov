class CongressPeopleController < ApplicationController
  before_action :set_congress_person, only: [:show, :edit, :update, :destroy]

  def index
    @congress_people = CongressPerson.all
  end

  def show
    @congress_person = CongressPerson.find(params[:id])
    # @congress_person_articles = @congress_person.articles
  end

  # GET /congress_people/new
  def new
    @congress_person = CongressPerson.new
  end

  # GET /congress_people/1/edit
  def edit
  end

  # POST /congress_people
  # POST /congress_people.json
  def create
    @congress_person = CongressPerson.new(congress_person_params)

    respond_to do |format|
      if @congress_person.save
        format.html { redirect_to @congress_person, notice: 'Congress person was successfully created.' }
        format.json { render :show, status: :created, location: @congress_person }
      else
        format.html { render :new }
        format.json { render json: @congress_person.errors, status: :unprocessable_entity }
      end
    end
  end

end
