require 'rails_helper'

RSpec.describe "mygmails/new", :type => :view do
  before(:each) do
    assign(:mygmail, Mygmail.new(
      :content => "MyText"
    ))
  end

  it "renders new mygmail form" do
    render

    assert_select "form[action=?][method=?]", mygmails_path, "post" do

      assert_select "textarea#mygmail_content[name=?]", "mygmail[content]"
    end
  end
end
