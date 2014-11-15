require "rails_helper"

RSpec.describe MygmailsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mygmails").to route_to("mygmails#index")
    end

    it "routes to #new" do
      expect(:get => "/mygmails/new").to route_to("mygmails#new")
    end

    it "routes to #show" do
      expect(:get => "/mygmails/1").to route_to("mygmails#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mygmails/1/edit").to route_to("mygmails#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mygmails").to route_to("mygmails#create")
    end

    it "routes to #update" do
      expect(:put => "/mygmails/1").to route_to("mygmails#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mygmails/1").to route_to("mygmails#destroy", :id => "1")
    end

  end
end
