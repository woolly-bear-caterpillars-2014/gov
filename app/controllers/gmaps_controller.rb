class GmapsController < ApplicationController
  respond_to :html, :json, :js
  def index
    TwitterHelper.run
  end
end
