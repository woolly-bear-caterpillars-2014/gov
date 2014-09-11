require "rails_helper"

RSpec.describe ArticlesLegislationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/articles_legislations").to route_to("articles_legislations#index")
    end

    it "routes to #new" do
      expect(:get => "/articles_legislations/new").to route_to("articles_legislations#new")
    end

    it "routes to #show" do
      expect(:get => "/articles_legislations/1").to route_to("articles_legislations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/articles_legislations/1/edit").to route_to("articles_legislations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/articles_legislations").to route_to("articles_legislations#create")
    end

    it "routes to #update" do
      expect(:put => "/articles_legislations/1").to route_to("articles_legislations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/articles_legislations/1").to route_to("articles_legislations#destroy", :id => "1")
    end

  end
end
