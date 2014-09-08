class GmapsController < ApplicationController

  # GET /gmaps
  # GET /gmaps.json
   require 'twitter'
  respond_to :html, :json, :js
  def index
    run
  end

#copy and paste the above into the rails console
#this will print the coordinates as an array of two strings like [ 'long', 'lat']
#we need to pass these coordinates to the api and plot them

  def run
    Thread.new do
      puts "in thread"
      STREAMINGCLIENT.filter(:locations => '-74,40,-73,41') do |tweet|
          File.open("public/data/data.json","w") do |f|
            f.write(tweet.to_json)
            end
        puts tweet.text
        puts tweet.geo.coordinates
      end 
    end
  end
end


#   # GET /gmaps/1
#   # GET /gmaps/1.json
#   def show
#   end

#   # GET /gmaps/new
#   def new
#     @gmap = Gmap.new
#   end

#   # GET /gmaps/1/edit
#   def edit
#   end

#   # POST /gmaps
#   # POST /gmaps.json
#   def create
#     @gmap = Gmap.new(gmap_params)

#     respond_to do |format|
#       if @gmap.save
#         format.html { redirect_to @gmap, notice: 'Gmap was successfully created.' }
#         format.json { render :show, status: :created, location: @gmap }
#       else
#         format.html { render :new }
#         format.json { render json: @gmap.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /gmaps/1
#   # PATCH/PUT /gmaps/1.json
#   def update
#     respond_to do |format|
#       if @gmap.update(gmap_params)
#         format.html { redirect_to @gmap, notice: 'Gmap was successfully updated.' }
#         format.json { render :show, status: :ok, location: @gmap }
#       else
#         format.html { render :edit }
#         format.json { render json: @gmap.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /gmaps/1
#   # DELETE /gmaps/1.json
#   def destroy
#     @gmap.destroy
#     respond_to do |format|
#       format.html { redirect_to gmaps_url, notice: 'Gmap was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_gmap
#       @gmap = Gmap.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def gmap_params
#       params[:gmap]
#     end
# end
