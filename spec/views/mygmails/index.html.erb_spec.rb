require 'rails_helper'

RSpec.describe "mygmails/index", :type => :view do
  before(:each) do
    assign(:mygmails, [
      Mygmail.create!(
        :content => "MyText"
      ),
      Mygmail.create!(
        :content => "MyText"
      )
    ])
  end

  it "renders a list of mygmails" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
