require 'rails_helper'

RSpec.describe "gmaps/show", :type => :view do
  before(:each) do
    @gmap = assign(:gmap, Gmap.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
