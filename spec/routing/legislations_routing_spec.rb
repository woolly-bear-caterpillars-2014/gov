require "rails_helper"

RSpec.describe LegislationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/legislations").to route_to("legislations#index")
    end

    it "routes to #new" do
      expect(:get => "/legislations/new").to route_to("legislations#new")
    end

    it "routes to #show" do
      expect(:get => "/legislations/1").to route_to("legislations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/legislations/1/edit").to route_to("legislations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/legislations").to route_to("legislations#create")
    end

    it "routes to #update" do
      expect(:put => "/legislations/1").to route_to("legislations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/legislations/1").to route_to("legislations#destroy", :id => "1")
    end

  end
end
