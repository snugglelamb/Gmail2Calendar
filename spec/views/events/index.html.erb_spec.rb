require 'rails_helper'

RSpec.describe "events/index", :type => :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :name => "Name",
        :location => "Location",
        :mygmail => nil
      ),
      Event.create!(
        :name => "Name",
        :location => "Location",
        :mygmail => nil
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
