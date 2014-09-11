require 'rails_helper'

RSpec.describe "legislations/new", :type => :view do
  before(:each) do
    assign(:legislation, Legislation.new())
  end

  it "renders new legislation form" do
    render

    assert_select "form[action=?][method=?]", legislations_path, "post" do
    end
  end
end
