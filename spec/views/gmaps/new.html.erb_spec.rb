require 'rails_helper'

RSpec.describe "gmaps/new", :type => :view do
  before(:each) do
    assign(:gmap, Gmap.new())
  end

  it "renders new gmap form" do
    render

    assert_select "form[action=?][method=?]", gmaps_path, "post" do
    end
  end
end
