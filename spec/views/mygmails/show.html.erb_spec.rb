require 'rails_helper'

RSpec.describe "mygmails/show", :type => :view do
  before(:each) do
    @mygmail = assign(:mygmail, Mygmail.create!(
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
