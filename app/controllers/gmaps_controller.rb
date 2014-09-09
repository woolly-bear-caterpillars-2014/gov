class GmapsController < ApplicationController
  respond_to :html, :json, :js
  def index
    TwitterHelper.run
  end
<<<<<<< HEAD
=======

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
>>>>>>> ee404e655ad693fd629e1a26056d8c5a2f4208f2
end
