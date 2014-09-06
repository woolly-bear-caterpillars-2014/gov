class StatesController < ApplicationController

  # GET /states
  # GET /states.json
  def index
    @states = State.all
  end

  # GET /states/1
  # GET /states/1.json
  def show
    @state = State.find_by(abbreviation: params[:id])
    @congress_people = @state.congress_people.where(title: "Congressperson")
    @senators = @state.congress_people.where(title: "Senator")
  end

  # GET /states/new

end
