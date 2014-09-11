require 'rails_helper'

RSpec.describe "states/new", :type => :view do
  before(:each) do
    assign(:state, State.new())
  end

  it "renders new state form" do
    render

    assert_select "form[action=?][method=?]", states_path, "post" do
    end
  end
end
