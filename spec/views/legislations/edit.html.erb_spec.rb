require 'rails_helper'

RSpec.describe "legislations/edit", :type => :view do
  before(:each) do
    @legislation = assign(:legislation, Legislation.create!())
  end

  it "renders the edit legislation form" do
    render

    assert_select "form[action=?][method=?]", legislation_path(@legislation), "post" do
    end
  end
end
