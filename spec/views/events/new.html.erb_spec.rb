require 'rails_helper'

RSpec.describe "events/new", :type => :view do
  before(:each) do
    assign(:event, Event.new(
      :name => "MyString",
      :location => "MyString",
      :mygmail => nil
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_name[name=?]", "event[name]"

      assert_select "input#event_location[name=?]", "event[location]"

      assert_select "input#event_mygmail_id[name=?]", "event[mygmail_id]"
    end
  end
end
