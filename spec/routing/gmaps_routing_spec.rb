require "rails_helper"

RSpec.describe GmapsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/gmaps").to route_to("gmaps#index")
    end

    it "routes to #new" do
      expect(:get => "/gmaps/new").to route_to("gmaps#new")
    end

    it "routes to #show" do
      expect(:get => "/gmaps/1").to route_to("gmaps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/gmaps/1/edit").to route_to("gmaps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/gmaps").to route_to("gmaps#create")
    end

    it "routes to #update" do
      expect(:put => "/gmaps/1").to route_to("gmaps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/gmaps/1").to route_to("gmaps#destroy", :id => "1")
    end

  end
end
