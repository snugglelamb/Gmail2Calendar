require 'rails_helper'

RSpec.describe "mygmails/edit", :type => :view do
  before(:each) do
    @mygmail = assign(:mygmail, Mygmail.create!(
      :content => "MyText"
    ))
  end

  it "renders the edit mygmail form" do
    render

    assert_select "form[action=?][method=?]", mygmail_path(@mygmail), "post" do

      assert_select "textarea#mygmail_content[name=?]", "mygmail[content]"
    end
  end
end
