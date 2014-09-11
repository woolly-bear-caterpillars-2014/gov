require 'rails_helper'

RSpec.describe "legislations/show", :type => :view do
  before(:each) do
    @legislation = assign(:legislation, Legislation.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
