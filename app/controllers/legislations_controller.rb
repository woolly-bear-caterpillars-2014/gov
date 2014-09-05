class LegislationsController < ApplicationController
  before_action :set_legislation, only: [:show, :edit, :update, :destroy]

  def index
    @legislations = Legislation.all
  end

  def show
  end

  def new
    @legislation = Legislation.new
  end

  def create
    @legislation = Legislation.new(legislation_params)

    respond_to do |format|
      if @legislation.save
        format.html { redirect_to @legislation, notice: 'Legislation was successfully created.' }
        format.json { render :show, status: :created, location: @legislation }
      else
        format.html { render :new }
        format.json { render json: @legislation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def legislation_params
      params.require(:legislation).permit(:title, :proposal_date, :publication_date, :congress_voting_date, :senate_voting_date, :president_signing_date, :abstract, :url, :type)
    end
end
