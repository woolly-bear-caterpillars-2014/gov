require 'rails_helper'

RSpec.describe "states/index", :type => :view do
  before(:each) do
    assign(:states, [
      State.create!(),
      State.create!()
    ])
  end

  it "renders a list of states" do
    render
  end
end
