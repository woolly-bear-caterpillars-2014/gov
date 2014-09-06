class StatesController < ApplicationController

  # GET /states
  # GET /states.json
  def index
    @states = State.all
  end

  # GET /states/1
  # GET /states/1.json
  def show
    abr = params[:id]
    p params[:id]
    @state = State.find_by(abbreviation: abr)
  end

  # GET /states/new

end
