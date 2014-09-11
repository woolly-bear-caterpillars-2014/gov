require "rails_helper"

RSpec.describe CongressPeopleController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/congress_people").to route_to("congress_people#index")
    end

    it "routes to #new" do
      expect(:get => "/congress_people/new").to route_to("congress_people#new")
    end

    it "routes to #show" do
      expect(:get => "/congress_people/1").to route_to("congress_people#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/congress_people/1/edit").to route_to("congress_people#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/congress_people").to route_to("congress_people#create")
    end

    it "routes to #update" do
      expect(:put => "/congress_people/1").to route_to("congress_people#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/congress_people/1").to route_to("congress_people#destroy", :id => "1")
    end

  end
end
