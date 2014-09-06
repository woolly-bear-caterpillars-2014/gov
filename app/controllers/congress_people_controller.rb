class CongressPeopleController < ApplicationController
  before_action :set_congress_person, only: [:show, :edit, :update, :destroy]

  # GET /congress_people
  # GET /congress_people.json
  def index
    @congress_people = CongressPerson.all
  end

  # GET /congress_people/1
  # GET /congress_people/1.json
  def show
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

  # PATCH/PUT /congress_people/1
  # PATCH/PUT /congress_people/1.json
  def update
    respond_to do |format|
      if @congress_person.update(congress_person_params)
        format.html { redirect_to @congress_person, notice: 'Congress person was successfully updated.' }
        format.json { render :show, status: :ok, location: @congress_person }
      else
        format.html { render :edit }
        format.json { render json: @congress_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /congress_people/1
  # DELETE /congress_people/1.json
  def destroy
    @congress_person.destroy
    respond_to do |format|
      format.html { redirect_to congress_people_url, notice: 'Congress person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_congress_person
      @congress_person = CongressPerson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def congress_person_params
      params[:congress_person]
    end
end
