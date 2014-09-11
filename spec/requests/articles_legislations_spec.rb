require 'rails_helper'

RSpec.describe "ArticlesLegislations", :type => :request do
  describe "GET /articles_legislations" do
    it "works! (now write some real specs)" do
      get articles_legislations_path
      expect(response.status).to be(200)
    end
  end
end
