class GooglemapsController < ApplicationController
	def index
    # @articles = Article.all
    # @result_set = FederalRegister::Article.search(:conditions => {:term => "Accessibility"})
	end

	@users = STREAMINGCLIENT.filter('-180,-90,180,90')
	@hash = Gmaps4rails.build_markers(@users) do |user, marker|
  	marker.lat user.latitude
  	marker.lng user.longitude
end

  
end