require 'rails_helper'

RSpec.describe "Legislations", :type => :request do
  describe "GET /legislations" do
    it "works! (now write some real specs)" do
      get legislations_path
      expect(response.status).to be(200)
    end
  end
end
