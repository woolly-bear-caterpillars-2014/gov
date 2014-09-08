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
      STREAMINGCLIENT.filter(:location => '-74,40,-73,41') do |tweet|
          File.open("public/data/data.json","w") do |f|
            f.write(tweet.to_json)
        end
      end
    end
  end
end
