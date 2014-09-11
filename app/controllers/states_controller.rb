class StatesController < ApplicationController

  def index
    @states = State.all
    
    state_hash = @states.map { |state| state.generate_hash }

    if request.xhr?
      render json: state_hash.to_json
    else
      render :index
    end
  end

  def show
    @state = State.find_by(abbreviation: params[:id])
    @democrat_count = @state.congress_people.where(party: "D").count
    @republican_count = @state.congress_people.where(party: "R").count
    @congress_people = @state.congress_people.where(title: "Congressperson")
    @senators = @state.congress_people.where(title: "Senator")
  end

  def create
    congress_member = params[:congress]

    if request.xhr?
      render json: congress_member.to_json
    else
      render :index
    end
  end
end
