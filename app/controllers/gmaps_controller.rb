class GmapsController < ApplicationController
  respond_to :html, :json, :js
  def index
  	@skip_footer = true
    TwitterService.run
  end
end
