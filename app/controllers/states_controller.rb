class StatesController < ApplicationController

  # GET /states
  # GET /states.json
  def index
    @states = State.all
    s = []
    @democrats = []
    @republicans = []
    @independents = []

    @states.each do |state|
      s << {
        name: state.abbreviation,
        democrat_count: state.democrat_count,
        republican_count: state.republican_count,
        independent_count: state.independent_count,
        political_leaning: state.political_leaning
      }
      # @democrats << state.congress_people.where(party: "D")
      # @republicans << state.congress_people.where(party: "R")
      # @independents << state.congress_people.where(party: "I")
    end

    # republicans = @states.
    #   congress_people.where(party: "Congressperson")
    # TweetStreamHelper.tw_config

    if request.xhr?
      render json: s.to_json
      # render json: {
      #   states: {
      #     name:
      #     demCount:
      #     repCount:
      #     indCount:
      #     politicalLeaning:


      #     }@states,
      #   democrats: @democrats,
      #   republicans: @republicans,
      #   indepentents: @indepentents
      # }.to_json
    else
      render :index
    end

    # @hash = Gmaps4rails.build_markers(@cities) do |city, marker|
    # marker.lat city.latitude
    # marker.lng city.longitude
    # marker.title "i'm the title"
    # marker.picture({
    #     :url => "/tweet.png",
    #     :width  => 32,
    #     :height => 32
    #     })
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
