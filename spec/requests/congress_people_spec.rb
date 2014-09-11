require 'rails_helper'

RSpec.describe "CongressPeople", :type => :request do
  describe "GET /congress_people" do
    it "works! (now write some real specs)" do
      get congress_people_path
      expect(response.status).to be(200)
    end
  end
end
