require 'rails_helper'

RSpec.describe "gmaps/edit", :type => :view do
  before(:each) do
    @gmap = assign(:gmap, Gmap.create!())
  end

  it "renders the edit gmap form" do
    render

    assert_select "form[action=?][method=?]", gmap_path(@gmap), "post" do
    end
  end
end
