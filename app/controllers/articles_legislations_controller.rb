class ArticlesLegislationsController < ApplicationController
  before_action :set_articles_legislation, only: [:show, :edit, :update, :destroy]

  def index
    @articles_legislations = ArticlesLegislation.all
  end

  def show
    @legislation = Legislation.find(params[:id])
  end

  def new
    @articles_legislation = ArticlesLegislation.new
  end

  def create
    @articles_legislation = ArticlesLegislation.new(articles_legislation_params)

    respond_to do |format|
      if @articles_legislation.save
        format.html { redirect_to @articles_legislation, notice: 'Articles legislation was successfully created.' }
        format.json { render :show, status: :created, location: @articles_legislation }
      else
        format.html { render :new }
        format.json { render json: @articles_legislation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def articles_legislation_params
      params.require(:articles_legislation).permit(:references, :references)
    end
end
