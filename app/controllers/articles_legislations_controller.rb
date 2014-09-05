class ArticlesLegislationsController < ApplicationController
  before_action :set_articles_legislation, only: [:show, :edit, :update, :destroy]

  # GET /articles_legislations
  # GET /articles_legislations.json
  def index
    @articles_legislations = ArticlesLegislation.all
  end

  # GET /articles_legislations/1
  # GET /articles_legislations/1.json
  def show
    @legislation = Legislation.find(params[:id])
  end

  # GET /articles_legislations/new
  def new
    @articles_legislation = ArticlesLegislation.new
  end

  # GET /articles_legislations/1/edit
  def edit
  end

  # POST /articles_legislations
  # POST /articles_legislations.json
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

  # PATCH/PUT /articles_legislations/1
  # PATCH/PUT /articles_legislations/1.json
  def update
    respond_to do |format|
      if @articles_legislation.update(articles_legislation_params)
        format.html { redirect_to @articles_legislation, notice: 'Articles legislation was successfully updated.' }
        format.json { render :show, status: :ok, location: @articles_legislation }
      else
        format.html { render :edit }
        format.json { render json: @articles_legislation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles_legislations/1
  # DELETE /articles_legislations/1.json
  def destroy
    @articles_legislation.destroy
    respond_to do |format|
      format.html { redirect_to articles_legislations_url, notice: 'Articles legislation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articles_legislation
      @articles_legislation = ArticlesLegislation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articles_legislation_params
      params.require(:articles_legislation).permit(:references, :references)
    end
end
