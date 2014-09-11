require 'rails_helper'

RSpec.describe "gmaps/index", :type => :view do
  before(:each) do
    assign(:gmaps, [
      Gmap.create!(),
      Gmap.create!()
    ])
  end

  it "renders a list of gmaps" do
    render
  end
end
