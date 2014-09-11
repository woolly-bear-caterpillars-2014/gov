require 'rails_helper'

RSpec.describe "legislations/index", :type => :view do
  before(:each) do
    assign(:legislations, [
      Legislation.create!(),
      Legislation.create!()
    ])
  end

  it "renders a list of legislations" do
    render
  end
end
