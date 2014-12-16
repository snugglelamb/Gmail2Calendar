require 'spec_helper'

describe DeviseHelper do
  before do
    view.stub(:resource).and_return(User.new)
    view.stub(:resource_name).and_return(:user)
    view.stub(:devise_mapping).and_return(Devise.mappings[:user])
  end

  describe "No Error Message" do
    it { helper.devise_error_messages!.should eql("") }
  end

  describe "Error Message Present" do
    it {
      view.stub(:resource).and_return(User.create)  
      helper.devise_error_messages!.should_not eql("")
    }
  end

end