require 'rails_helper'

RSpec.describe "Mygmails", :type => :request do
  describe "GET /mygmails" do
    it "works! (now write some real specs)" do
      get mygmails_path
      expect(response).to have_http_status(200)
    end
  end
end
