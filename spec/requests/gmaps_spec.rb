require 'rails_helper'

RSpec.describe "Gmaps", :type => :request do
  describe "GET /gmaps" do
    it "works! (now write some real specs)" do
      get gmaps_path
      expect(response.status).to be(200)
    end
  end
end
